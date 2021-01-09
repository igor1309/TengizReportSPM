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
        let bodyPattern = #"(?m)(?:^[А-Яа-я ]+:.*$)(?:\n.*$)+?\nИТОГ:.*"#

        let header = self.firstMatch(for: headerPattern) ?? "error getting header"

        let body = self
            // cut header
            .replaceMatches(for: headerPattern, withString: "")
            // cut footer
            .replaceMatches(for: footerPattern, withString: "")
            // delete column title row
            .replaceMatches(for: columnTitleRowPattern, withString: "")
            .listMatches(for: bodyPattern)

        let footer = self.firstMatch(for: footerPattern) ?? "error getting footer"
        let errorMessage = ""

        return ReportContent(header: header,
                             body: body,
                             footer: footer,
                             errorMessage: errorMessage)
    }
}
