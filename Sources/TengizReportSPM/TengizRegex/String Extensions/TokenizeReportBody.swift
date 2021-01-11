//
//  TokenizeReportBody.swift
//  
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public extension String {

    // MARK: - Tokenize Report Body

    func tokenizeReportBodyGroup() -> [Tokens.BodyToken] {
        //  FIXME: FINISH THIS: how to store initial string in tokenized body?
        // self.groupString = groupString

        let itemLine = String.itemFullLineWithDigitsPattern + #"|"# + String.itemCorrectionLine
        let listWithNumbers = self.listMatches(for: itemLine)
        let items = listWithNumbers.map(Tokens.BodyToken.init)

        let components = self.components(separatedBy: "\n")
        let bodyHeaderString = components.first ?? "header error"
        let bodyFooterString = components.last ?? "footer error"

        let bodyHeader = bodyHeaderString.getBodyHeader()
        let bodyFooter = bodyFooterString.getBodyFooter()

        return [bodyHeader] + items + [bodyFooter]
        //        return items
    }

    func getBodyHeader() -> Tokens.BodyToken {
        guard let title = self.firstMatch(for: String.bodyHeaderFooterTitlePattern) else {
            return Tokens.BodyToken(source: self, symbol: .empty)
        }

        guard let firstTail = self.replaceFirstMatch(for: String.bodyHeaderFooterTitlePattern,
                                                     withString: ""),
              let firstPercentageString = firstTail.firstMatch(for: String.percentagePattern),
              let firstPercentage = firstPercentageString.percentageStringToDouble() else {
            return Tokens.BodyToken(
                source: self,
                symbol: .header(title: title, value: nil, percentage: nil)
            )
        }

        let secondtail = firstTail.replaceFirstMatch(for: String.percentagePattern,
                                                     withString: "")
        guard let secondPercentageString = secondtail?.firstMatch(for: String.percentagePattern),
              let secondPercentage = secondPercentageString.percentageStringToDouble() else {
            return Tokens.BodyToken(
                source: self, symbol: .header(title: title, value: firstPercentage, percentage: nil)
            )
        }

        return Tokens.BodyToken(
            source: self,
            symbol: .header(title: title, value: firstPercentage, percentage: secondPercentage)
        )
    }

    func getBodyFooter() -> Tokens.BodyToken {
        guard let title = self.firstMatch(for: String.bodyHeaderFooterTitlePattern) else {
            return Tokens.BodyToken(source: self, symbol: .empty)
        }

        guard let tail = self.replaceFirstMatch(for: String.bodyHeaderFooterTitlePattern, withString: ""),
              let number = tail.getNumberNoRemains() else {
            return Tokens.BodyToken(source: self, symbol: .footer(title: title, value: nil))
        }

        return Tokens.BodyToken(source: self, symbol: .footer(title: title, value: number))
    }

    // MARK: - Tokenize Report Body GENERIC

    func tokenizeReportBodyGroupGENERIC() -> [Token<BodySymbol>] {
        //  FIXME: FINISH THIS: how to store initial string in tokenized body?
        // self.groupString = groupString

        let itemLine = String.itemFullLineWithDigitsPattern + #"|"# + String.itemCorrectionLine
        let listWithNumbers = self.listMatches(for: itemLine)
        let items = listWithNumbers.map(Token<BodySymbol>.init)

        let components = self.components(separatedBy: "\n")
        let bodyHeaderString = components.first ?? "header error"
        let bodyFooterString = components.last ?? "footer error"

        let bodyHeader = bodyHeaderString.getBodyHeaderGENERIC()
        let bodyFooter = bodyFooterString.getBodyFooterGENERIC()

        return [bodyHeader] + items + [bodyFooter]
        //        return items
    }

    func getBodyHeaderGENERIC() -> Token<BodySymbol> {
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

    func getBodyFooterGENERIC() -> Token<BodySymbol> {
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
