//
//  TokenizeReportBody.swift
//  
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

#warning("do you need same for others?")
public extension Token where Symbol == BodySymbol {
    static let empty = Token(source: "", symbol: .empty)
}

public extension String {

    // MARK: - Tokenize Report Body GENERIC

    func reportBodyGroup() -> [Token<BodySymbol>] {
        //  FIXME: FINISH THIS: how to store initial string in tokenized body?
        // self.groupString = groupString

        let itemLine = Patterns.itemFullLineWithDigits + #"|"# + Patterns.itemCorrectionLine
        let items = self.listMatches(for: itemLine).map(Token<BodySymbol>.init)

        let components = self.components(separatedBy: "\n")
        let bodyHeader = components.first?.bodyHeader() ?? .empty
        let bodyFooter = components.last?.bodyFooter() ?? .empty

        return [bodyHeader] + items + [bodyFooter]
    }

    func bodyHeader() -> Token<BodySymbol>? {
        guard let title = self.firstMatch(for: Patterns.bodyHeaderFooterTitle) else { return nil }

        let symbol: BodySymbol = {
            guard let firstTail = self.replaceFirstMatch(for: Patterns.bodyHeaderFooterTitle,
                                                         withString: ""),
                  let firstPercentageString = firstTail.firstMatch(for: Patterns.percentage),
                  let firstPercentage = firstPercentageString.percentageStringToDouble()
            else {
                return .header(title: title, value: nil, percentage: nil)
            }

            guard let secondtail = firstTail.replaceFirstMatch(for: Patterns.percentage,
                                                               withString: ""),
                  let secondPercentageString = secondtail.firstMatch(for: Patterns.percentage),
                  let secondPercentage = secondPercentageString.percentageStringToDouble()
            else {
                return .header(title: title, value: firstPercentage, percentage: nil)
            }

            return .header(title: title, value: firstPercentage, percentage: secondPercentage)
        }()

        return Token<BodySymbol>(source: self, symbol: symbol)
    }

    func bodyFooter() -> Token<BodySymbol>? {
        guard let title = self.firstMatch(for: Patterns.bodyHeaderFooterTitle) else { return nil }
        // guard let title = self.firstMatch(for: #"^ИТОГ(?=:)"#) else { return nil }

        let symbol: BodySymbol = {
            guard let tail = self.replaceFirstMatch(for: Patterns.bodyHeaderFooterTitle, withString: ""),
                  let number = tail.numberWithSign() else {
                return .footer(title: title, value: nil)
            }

            return .footer(title: title, value: number)
        }()

        return Token<BodySymbol>(source: self, symbol: symbol)
    }

}
