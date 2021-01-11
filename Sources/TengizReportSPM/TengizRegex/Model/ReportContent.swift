//
//  ReportContent.swift
//  TextViewApp
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public struct ReportContent: Equatable {

    public var header: String
    public var body: [String]
    public var footer: String

    public var errorMessage = ""
    public var hasError: Bool { !errorMessage.isEmpty }

    public static let empty = ReportContent(header: "", body: [], footer: "")

    public init(header: String, body: [String], footer: String, errorMessage: String = "") {
        self.header = header
        self.body = body
        self.footer = footer
        self.errorMessage = errorMessage
    }
}
