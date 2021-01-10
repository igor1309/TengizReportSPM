//
//  FooterToken+Ext.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 10.01.2021.
//

import Foundation

extension Tokens.FooterToken: StringInitializable {
    public init(string: String) {
        self.init(source: string, symbol: Tokens.FooterToken.Symbol(string: string))
    }
}

extension Tokens.FooterToken.Symbol: StringInitializable {
    public init(string: String) {
        let symbol: Tokens.FooterToken.Symbol = {

            if string.firstMatch(for: #"ИТОГ:"#) != nil,
               let number = string.getNumberNoRemains() {
                return .total("ИТОГ", number)
            }

            if string.firstMatch(for: #"ИТОГ всех расходов за месяц"#) != nil,
               let number = string.getNumberNoRemains() {
                return .expensesTotal("ИТОГ всех расходов за месяц", number)
            }

            if string.firstMatch(for: #"[П\п]ереход"#) != nil,
               let number = string.getNumberNoRemains() {
                return .openingBalance(string.trimmingCharacters(in: .whitespaces), number)
            }

            if string.firstMatch(for: #"Фактический остаток:"#) != nil {
                // get percentage and remains (replace percentage with "")
                guard let percentageString = string.firstMatch(for: String.percentagePattern),
                      let percentage = percentageString.percentageStringToDouble()
                else { return .error }

                let remains = string.replaceMatches(for: String.percentagePattern, withString: "")
                // get number
                if let number = remains.getNumberNoRemains() {
                    return .balance("Фактический остаток", number, percentage)
                }
            }

            return .tbd
        }()

        self = symbol
    }
}

