//
//  splitReportContent.swift
//  
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public extension String {

    func splitReportContent() -> ReportContent {

        let headerPattern = #"(?m)(^(.*)\n)+?(?=Статья расхода:)"#
        let footerPattern = #"(?m)^ИТОГ всех расходов за месяц.*\n(^.*\n)*"#
        let columnTitleRowPattern = #"(?m)^Статья расхода:\s*Сумма расхода:\s*План %\s*Факт %\s*\n"#
        let groupPattern = #"(?m)(?:^[А-Яа-я ]+:.*$)(?:\n.*$)+?\nИТОГ:.*"#

        let headerString = self.firstMatch(for: headerPattern) ?? "error getting header"

        let groups = self
            // cut header
            .replaceMatches(for: headerPattern, withString: "")
            // cut footer
            .replaceMatches(for: footerPattern, withString: "")
            // delete column title row
            .replaceMatches(for: columnTitleRowPattern, withString: "")
            .listMatches(for: groupPattern)

        let footerString = self.firstMatch(for: footerPattern) ?? "error getting footer"
        let errorMessage = ""

        return ReportContent(headerString: headerString,
                             groups: groups,
                             footerString: footerString,
                             errorMessage: errorMessage)
    }
}
