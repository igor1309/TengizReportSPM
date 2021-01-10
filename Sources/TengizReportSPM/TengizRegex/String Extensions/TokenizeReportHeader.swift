//
//  TokenizeReportHeader.swift
//  
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public extension String {

    // MARK: - Tokenize Report Header

    func tokenizeReportHeader() -> [Tokens.HeaderToken] {
        let cleanHeader = self.cleanReport()

        let headerCompanyPattern = #"(?<=Название объекта:\s).*"#
        let headerMonthPattern = #"[А-Яа-я]+\d{4}"#
        let headerItemTitlePattern = #"[А-Яа-я ]+(?=:)"#
        let headerItemPattern = headerItemTitlePattern + #":[А-Яа-я ]*\d+(\.\d{3})*"#

        func error(string: String) -> Tokens.HeaderToken {
            Tokens.HeaderToken(source: string, symbol: .error)
        }

        let company: Tokens.HeaderToken = {
            guard let companyString = cleanHeader.firstMatch(for: headerCompanyPattern) else { return error(string: cleanHeader) }

            return Tokens.HeaderToken(source: self, symbol: .company(name: companyString))
        }()

        let month: Tokens.HeaderToken = {
            guard let monthString = cleanHeader.firstMatch(for: headerMonthPattern) else { return error(string: cleanHeader) }

            return Tokens.HeaderToken(source: self, symbol: .month(monthStr: monthString))
        }()

        let tail: String = cleanHeader.replaceMatches(for: headerMonthPattern, withString: "")

        let headerItems: [Tokens.HeaderToken] = tail
            .listMatches(for: headerItemPattern)
            .map {
                guard let title = $0.firstMatch(for: headerItemTitlePattern),
                      let number = $0.extractNumber() else { return error(string: $0) }

                return Tokens.HeaderToken(source: $0, symbol: .item(title: title, value: number))
            }

        return [company, month] + headerItems
    }

}
