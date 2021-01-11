//
//  TokenizeReportBody.swift
//  
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public extension String {

    // MARK: - Tokenize Report Body GENERIC

    func reportBodyGroup() -> [Token<BodySymbol>] {
        //  FIXME: FINISH THIS: how to store initial string in tokenized body?
        // self.groupString = groupString

        let itemLine = String.itemFullLineWithDigitsPattern + #"|"# + String.itemCorrectionLine
        let listWithNumbers = self.listMatches(for: itemLine)
        let items = listWithNumbers.map(Token<BodySymbol>.init)

        let components = self.components(separatedBy: "\n")
        let bodyHeaderString = components.first ?? "header error"
        let bodyFooterString = components.last ?? "footer error"

        let bodyHeader = bodyHeaderString.bodyHeader()
        let bodyFooter = bodyFooterString.bodyFooter()

        return [bodyHeader] + items + [bodyFooter]
        //        return items
    }

    func bodyHeader() -> Token<BodySymbol> {
        guard let title = self.firstMatch(for: String.bodyHeaderFooterTitlePattern) else {
            return Token<BodySymbol>(source: self, symbol: .empty)
        }

        let symbol: BodySymbol = {
            guard let firstTail = self.replaceFirstMatch(for: String.bodyHeaderFooterTitlePattern,
                                                         withString: ""),
                  let firstPercentageString = firstTail.firstMatch(for: String.percentagePattern),
                  let firstPercentage = firstPercentageString.percentageStringToDouble()
            else {
                return .header(title: title, value: nil, percentage: nil)
            }

            let secondtail = firstTail.replaceFirstMatch(for: String.percentagePattern,
                                                         withString: "")
            guard let secondPercentageString = secondtail?.firstMatch(for: String.percentagePattern),
                  let secondPercentage = secondPercentageString.percentageStringToDouble()
            else {
                return .header(title: title, value: firstPercentage, percentage: nil)
            }

            return .header(title: title, value: firstPercentage, percentage: secondPercentage)
        }()

        return Token<BodySymbol>(source: self, symbol: symbol)
    }

    func bodyFooter() -> Token<BodySymbol> {
        let symbol: BodySymbol = {
            guard let title = self.firstMatch(for: String.bodyHeaderFooterTitlePattern) else {
                return .empty
            }

            guard let tail = self.replaceFirstMatch(for: String.bodyHeaderFooterTitlePattern, withString: ""),
                  let number = tail.getNumberNoRemains() else {
                return .footer(title: title, value: nil)
            }

            return .footer(title: title, value: number)
        }()

        return Token<BodySymbol>(source: self, symbol: symbol)
    }

}
