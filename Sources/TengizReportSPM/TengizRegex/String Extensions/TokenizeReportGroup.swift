//
//  TokenizeReportGroup.swift
//  
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public extension String {

    // MARK: - Tokenize Report Group

    // swiftlint:disable:next function_body_length
    func transformLineToGroupItem() -> Tokens.GroupToken? {
        var title: String = ""
        var remains: String = ""
        var number: Double?

        /// tokenize lines like `"-10.000 за перерасход питание персонала в июле"`
        if self.firstMatch(for: String.itemCorrectionLine) != nil,
           let number = self.getNumberNoRemains() {
            return .item("Correction", number, self)
        }

        /// tokenize lines like `"12.Интернет    7.701+4.500"` or `"1. Аренда торгового помещения     200.000 (за август) +400.000 (за сентябрь)        "`
        if self.firstMatch(for: String.itemWithPlusPattern) != nil,
           let titleString = self.firstMatch(for: String.itemTitlePattern),
           let remains = self.firstMatch(for: String.numbersWithPlusPattern) {
            let sum = remains
                .listMatches(for: String.itemNumberPattern)
                .compactMap { $0.getNumberNoRemains() }
                .reduce(0, +)

            return .item(titleString.clearWhitespacesAndNewlines(),
                         sum,
                         remains.clearWhitespacesAndNewlines())
        }

        let itemWithItogoPattern = #".*?Итого"#
        if self.firstMatch(for: itemWithItogoPattern) != nil {

            let prihodPattern = #"1. Приход товара по накладным"#
            if let titleString = self.firstMatch(for: prihodPattern),
               let afterItogo = self.replaceFirstMatch(for: itemWithItogoPattern, withString: ""),
               let number = afterItogo.getNumberNoRemains(),
               let comment = self.replaceFirstMatch(for: prihodPattern, withString: "") {
                return .item(titleString, number, comment.clearWhitespacesAndNewlines())
            }

            let prepayPattern = #"2. Предоплаченный товар, но не отраженный в приходе"#
            if let titleString = self.firstMatch(for: prepayPattern),
               let afterItogo = self.replaceFirstMatch(for: itemWithItogoPattern, withString: ""),
               let number = afterItogo.getNumberNoRemains(),
               let comment = self.replaceFirstMatch(for: prepayPattern, withString: "") {
                return .item(titleString, number, comment.clearWhitespacesAndNewlines())
            }

        }

        /// tokenize line like `"2. Предоплаченный товар, но не отраженный в приходе    Студиопак-12.500 (влажные салфетки);"`
        let anotherPrepayPattern = #"2. Предоплаченный товар, но не отраженный в приходе(?=\s+[А-Яа-я])"#
        if let titleString = self.firstMatch(for: anotherPrepayPattern) {
            let comment = self.replaceMatches(for: anotherPrepayPattern, withString: "")
            if let number = comment.extractNumber() {
                return .item(titleString, number, comment.clearWhitespacesAndNewlines())
            }
        }

        let itemTitlePatterns = [String.itemTitleWithPercentagePattern,
                                 String.itemTitleWithParenthesesPattern,
                                 String.itemTitlePattern]

        self.getFirstMatchAndRemains(patterns: itemTitlePatterns) { (match, remainsString) in
            guard let headString = match,
                  let tailString = remainsString else { return }
            title = headString
            remains = tailString
        }

        guard !title.isEmpty && !remains.isEmpty else { return nil }

        (number, remains) = remains.getNumberAndRemains()

        /// special case when number after item title is not a number for item
        /// for example in `"1. Приход товара по накладным     946.056р (оплаты фактические: 475.228р 52к -переводы; 157.455р 85к-корпоративная карта; 0-наличные из кассы; Итого-632.684р 37к)"`
        if let afterItogo = remains.replaceFirstMatch(for: itemWithItogoPattern, withString: "") {
            number = afterItogo.getNumberNoRemains()
        }

        /// another special case when number after item title is not a number for item
        /// for example in `"1. Приход товара по накладным    451.198р41к (из них у нас оплачено фактический 21.346р15к)"`
        let factPattern = #".*?фактический"#
        if let afterFact = remains.replaceFirstMatch(for: factPattern, withString: "") {
            number = afterFact.getNumberNoRemains()
            remains = self.replaceFirstMatch(for: String.itemTitlePattern + #""#, withString: "") ?? self
        }

        let dirtyComment = remains.clearWhitespacesAndNewlines()
        let comment: String? = dirtyComment.isEmpty ? nil : dirtyComment

        return .item(title, number ?? 0, comment)
    }

    func getGroupHeader() -> Tokens.GroupToken? {
        guard let title = self.firstMatch(for: String.groupHeaderFooterTitlePattern) else { return nil }

        guard let firstTail = self.replaceFirstMatch(for: String.groupHeaderFooterTitlePattern, withString: ""),
              let firstPercentageString = firstTail.firstMatch(for: String.percentagePattern),
              let firstPercentage = firstPercentageString.percentageStringToDouble() else {
            return .header(title, nil, nil)
        }

        let secondtail = firstTail.replaceFirstMatch(for: String.percentagePattern,
                                                     withString: "")
        guard let secondPercentageString = secondtail?.firstMatch(for: String.percentagePattern),
              let secondPercentage = secondPercentageString.percentageStringToDouble() else {
            return .header(title, firstPercentage, nil)
        }

        return .header(title, firstPercentage, secondPercentage)
    }

    func getGroupFooter() -> Tokens.GroupToken? {
        guard let title = self.firstMatch(for: String.groupHeaderFooterTitlePattern) else { return nil }

        guard let tail = self.replaceFirstMatch(for: String.groupHeaderFooterTitlePattern, withString: ""),
              let number = tail.getNumberNoRemains()
        else { return .footer(title, nil) }

        return .footer(title, number)
    }


}
