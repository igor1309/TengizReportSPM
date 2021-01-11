//
//  FooterToken+Ext.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 10.01.2021.
//

import Foundation

extension Tokens.FooterToken: ExpressibleByStringLiteral {
    public init(stringLiteral string: String) {
        self.init(source: string, symbol: Tokens.FooterToken.Symbol(stringLiteral: string))
    }
}

extension FooterSymbol: ExpressibleByStringLiteral {
    public init(stringLiteral string: String) {
        self = string.footerSymbol()
    }
}

public extension String {
    func footerSymbol() -> FooterSymbol {
        if self.firstMatch(for: #"ИТОГ:"#) != nil,
           let number = self.getNumberNoRemains() {
            return .total("ИТОГ", number)
        }

        if self.firstMatch(for: #"ИТОГ всех расходов за месяц"#) != nil,
           let number = self.getNumberNoRemains() {
            return .expensesTotal("ИТОГ всех расходов за месяц", number)
        }

        if self.firstMatch(for: #"[П\п]ереход"#) != nil,
           let number = self.getNumberNoRemains() {
            return .openingBalance(self.trimmingCharacters(in: .whitespaces), number)
        }

        if self.firstMatch(for: #"Фактический остаток:"#) != nil {
            // get percentage and remains (replace percentage with "")
            guard let percentageString = self.firstMatch(for: String.percentagePattern),
                  let percentage = percentageString.percentageStringToDouble()
            else { return .error }

            let remains = self.replaceMatches(for: String.percentagePattern, withString: "")
            // get number
            if let number = remains.getNumberNoRemains() {
                return .balance("Фактический остаток", number, percentage)
            }
        }

        #warning("TBD or ERROR???")
        return .tbd
    }
}
