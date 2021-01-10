//
//  HeaderToken+Ext.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 10.01.2021.
//

import Foundation

extension Tokens.HeaderToken: StringInitializable {
    public init(string: String) {
        self.init(source: string, symbol: Tokens.HeaderToken.Symbol(string: string))
    }
}

public extension String {
    static let headerItemTitlePattern = #"[А-Яа-я ]+(?=:)"#
    static let headerItemPattern = headerItemTitlePattern + #":[А-Яа-я ]*\d+(\.\d{3})*"#
}

extension HeaderSymbol: StringInitializable {
    public init(string: String) {
        let headerCompanyPattern = #"(?<=Название объекта:\s).*"#
        let headerMonthPattern = #"[А-Яа-я]+\d{4}"#

        if let companyString = string.firstMatch(for: headerCompanyPattern) {
            self = .company(name: companyString)
        } else if let monthString = string.firstMatch(for: headerMonthPattern) {
            self = .month(monthStr: monthString)
        } else if let title = string.firstMatch(for: String.headerItemTitlePattern),
                  let number = string.extractNumber() {
            self = .item(title: title, value: number)
        } else {
            self = .error
        }
    }
}

