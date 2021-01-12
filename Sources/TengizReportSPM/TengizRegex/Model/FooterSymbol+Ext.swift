//
//  FooterToken+Ext.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 10.01.2021.
//

import Foundation

extension FooterSymbol: ExpressibleByStringLiteral {
    public init(stringLiteral string: String) {
        self = string.footerSymbol()
    }
}

public extension String {
    func footerSymbol() -> FooterSymbol {
        if self.firstMatch(for: #"ИТОГ:"#) != nil,
           let number = self.numberWithSign() {
            return .total("ИТОГ", number)
        }

        if self.firstMatch(for: #"ИТОГ всех расходов за месяц"#) != nil,
           let number = self.numberWithSign() {
            return .expensesTotal("ИТОГ всех расходов за месяц", number)
        }

        if self.firstMatch(for: #"[П\п]ереход"#) != nil,
           let number = self.numberWithSign() {
            return .openingBalance(self.trimmingCharacters(in: .whitespaces), number)
        }

        if self.firstMatch(for: #"Фактический остаток:"#) != nil {
            // get percentage and remains (replace percentage with "")
            guard let percentageString = self.firstMatch(for: Patterns.percentage),
                  let percentage = percentageString.percentageStringToDouble()
            else { return .error }

            let remains = self.replaceMatches(for: Patterns.percentage, withString: "")
            // get number
            if let number = remains.numberWithSign() {
                return .balance("Фактический остаток", number, percentage)
            }
        }

        #warning("TBD or ERROR???")
        return .tbd
    }
}
