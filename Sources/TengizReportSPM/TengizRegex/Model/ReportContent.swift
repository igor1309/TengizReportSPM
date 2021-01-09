//
//  ReportContent.swift
//  TextViewApp
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public extension String {
    func splitReportContent() -> ReportContent {
        ReportContent(string: self)
    }
}

public struct ReportContent: Equatable {

    public var header: String
    public var body: [String]
    public var footer: String

    public var errorMessage = ""
    public var hasError: Bool { !errorMessage.isEmpty }

    public init(header: String, body: [String], footer: String, errorMessage: String = "") {
        self.header = header
        self.body = body
        self.footer = footer
        self.errorMessage = errorMessage
    }

    public static let empty = ReportContent(header: "", body: [], footer: "")
}

public extension ReportContent {
    var printStr: String {
        let all = [header] + body + [footer]
        return all.joined(separator: "\n" + String(repeating: "#", count: 120) + "\n")
    }

    init(string: String) {
        let headerPattern = #"(?m)(^(.*)\n)+?(?=Статья расхода:)"#
        let footerPattern = #"(?m)^ИТОГ всех расходов за месяц.*\n(^.*\n)*"#
        let columnTitleRowPattern = #"(?m)^Статья расхода:\s*Сумма расхода:\s*План %\s*Факт %\s*\n"#
        let bodyPattern = #"(?m)(?:^[А-Яа-я ]+:.*$)(?:\n.*$)+?\nИТОГ:.*"#

        let header = string.firstMatch(for: headerPattern) ?? "error getting header"
        let footer = string.firstMatch(for: footerPattern) ?? "error getting footer"

        let body = string
            // cut header
            .replaceMatches(for: headerPattern, withString: "")
            // cut footer
            .replaceMatches(for: footerPattern, withString: "")
            // delete column title row
            .replaceMatches(for: columnTitleRowPattern, withString: "")
            .listMatches(for: bodyPattern)

        #warning("finish with error message")
        let errorMessage = ""

        self.init(header: header, body: body, footer: footer, errorMessage: errorMessage)
    }

}

