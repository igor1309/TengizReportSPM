//
//  HeaderToken+Ext.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 10.01.2021.
//

import Foundation

extension HeaderSymbol: ExpressibleByStringLiteral {
    public init(stringLiteral string: String) {
        self = string.headerSymbol()
    }
}

public extension String {
    func headerSymbol() -> HeaderSymbol {
        let headerCompanyPattern = #"(?<=Название объекта:\s).*"#
        let headerMonthPattern = #"[А-Яа-я]+\d{4}"#

        // company
        if let companyString = self.firstMatch(for: headerCompanyPattern) {
            return .company(name: companyString)
        }

        // month
        if let monthString = self.firstMatch(for: headerMonthPattern) {
            return .month(monthStr: monthString)
        }

        // item
        if let title = self.firstMatch(for: String.headerItemTitlePattern),
           let number = self.numberWithoutSign() {
            return .item(title: title, value: number)
        }

        return .error
    }
}

public extension String {
    static let headerItemTitlePattern = #"[А-Яа-я ]+(?=:)"#
    static let headerItemPattern = headerItemTitlePattern + #":[А-Яа-я ]*\d+(\.\d{3})*"#
}
