//
//  BodySymbol+Ext.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 10.01.2021.
//

import Foundation

extension Tokens.BodyToken: StringInitializable {
    public init(string: String) {
        self.init(source: string, symbol: Symbol(string: string))
    }
}

extension BodySymbol: StringInitializable {
    // swiftlint:disable:next function_body_length
    public init(string: String) {
        var title: String = ""
        var remains: String = ""
        var number: Double?

        /// tokenize lines like `"-10.000 за перерасход питание персонала в июле"`
        if string.firstMatch(for: String.itemCorrectionLine) != nil,
           let number = string.getNumberNoRemains() {
            self = .item(title: "Correction", value: number, comment: string)
            return
        }

        /// tokenize lines like `"12.Интернет    7.701+4.500"` or
        /// `"1. Аренда торгового помещения     200.000 (за август) +400.000 (за сентябрь)        "`
        if string.firstMatch(for: String.itemWithPlusPattern) != nil,
           let titleString = string.firstMatch(for: String.itemTitlePattern),
           let remains = string.firstMatch(for: String.numbersWithPlusPattern) {
            let sum = remains
                .listMatches(for: String.itemNumberPattern)
                .compactMap { $0.getNumberNoRemains() }
                .reduce(0, +)
            #warning("need clearWhitespacesAndNewlines here?")
            self = .item(title: titleString.clearWhitespacesAndNewlines(),
                         value: sum,
                         comment: remains.clearWhitespacesAndNewlines())
            return
        }

        let itemWithItogoPattern = #".*?Итого"#
        if string.firstMatch(for: itemWithItogoPattern) != nil {

            let prihodPattern = #"1. Приход товара по накладным"#
            if let titleString = string.firstMatch(for: prihodPattern),
               let afterItogo = string.replaceFirstMatch(for: itemWithItogoPattern, withString: ""),
               let number = afterItogo.getNumberNoRemains(),
               let comment = string.replaceFirstMatch(for: prihodPattern, withString: "") {
                #warning("need clearWhitespacesAndNewlines here?")
                self = .item(title: titleString,
                             value: number,
                             comment: comment.clearWhitespacesAndNewlines())
                return
            }

            let prepayPattern = #"2. Предоплаченный товар, но не отраженный в приходе"#
            if let titleString = string.firstMatch(for: prepayPattern),
               let afterItogo = string.replaceFirstMatch(for: itemWithItogoPattern, withString: ""),
               let number = afterItogo.getNumberNoRemains(),
               let comment = string.replaceFirstMatch(for: prepayPattern, withString: "") {
                #warning("need clearWhitespacesAndNewlines here?")
                self = .item(title: titleString,
                             value: number,
                             comment: comment.clearWhitespacesAndNewlines())
                return
            }

        }

        /// tokenize line like `"2. Предоплаченный товар, но не отраженный в приходе    Студиопак-12.500 (влажные салфетки);"`
        let anotherPrepayPattern = #"2. Предоплаченный товар, но не отраженный в приходе(?=\s+[А-Яа-я])"#
        if let titleString = string.firstMatch(for: anotherPrepayPattern) {
            let comment = string.replaceMatches(for: anotherPrepayPattern, withString: "")
            if let number = comment.extractNumber() {
                #warning("need clearWhitespacesAndNewlines here?")
                self = .item(title: titleString,
                             value: number,
                             comment: comment.clearWhitespacesAndNewlines())
                return
            }
        }

        let itemTitlePatterns = [String.itemTitleWithPercentagePattern,
                                 String.itemTitleWithParenthesesPattern,
                                 String.itemTitlePattern]

        string.getFirstMatchAndRemains(patterns: itemTitlePatterns) { (match, remainsString) in
            guard let headString = match,
                  let tailString = remainsString else { return }
            title = headString
            remains = tailString
        }

        guard !title.isEmpty && !remains.isEmpty else {
            #warning("what to return here as source?")
            self = .empty
            return
        }

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
            remains = string.replaceFirstMatch(for: String.itemTitlePattern + #""#, withString: "") ?? string
        }

        let dirtyComment = remains.clearWhitespacesAndNewlines()
        let comment: String? = dirtyComment.isEmpty ? nil : dirtyComment

        self = .item(title: title, value: number ?? 0, comment: comment)
        return
    }
}
