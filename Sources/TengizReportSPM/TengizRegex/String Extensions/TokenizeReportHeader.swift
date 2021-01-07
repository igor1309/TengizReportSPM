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

        let company: Tokens.HeaderToken? = {
            guard let companyString = cleanHeader.firstMatch(for: headerCompanyPattern) else { return nil }
            return .company(companyString)
        }()

        let month: Tokens.HeaderToken? = {
            guard let monthString = cleanHeader.firstMatch(for: headerMonthPattern) else { return nil }
            return .month(monthString.trimmingCharacters(in: .whitespaces))
        }()

        let tail: String = cleanHeader.replaceMatches(for: headerMonthPattern, withString: "")

        let headerItems: [Tokens.HeaderToken] = tail
            .listMatches(for: headerItemPattern)
            .compactMap {
                guard let title = $0.firstMatch(for: headerItemTitlePattern) else { return nil }
                let cleanTitle = title.trimmingCharacters(in: .whitespaces)
                guard let number = $0.extractNumber() else { return nil }
                return .headerItem(cleanTitle, number)
            }

        return [company, month].compactMap { $0 } + headerItems
    }

}