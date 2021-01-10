//
//  Printable.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 10.01.2021.
//

import Foundation

protocol Printable {
    var printStr: String { get }
}

extension Tokens.HeaderToken.Symbol: Printable {
    public var printStr: String {
        switch self {
            case let .company(name):
                return "company: \"\(name)\""

            case let .month(month):
                return "month: \"\(month)\""

            case let .item(title, value):
                return "\"\(title)\": \(value)"

            case .error:
                return ""
        }
    }
}

extension Tokens.BodyToken.Symbol: Printable {
    public var printStr: String {
        switch self {
            case let .item(title, number, comment):
                let commentString = (comment == nil || (comment?.isEmpty ?? false)) ? "" : " comment: \"\(comment!)\""
                return "item: title: \"\(title)\" number: \(number)\(commentString)"

            case let .header(title, number1, number2):
                let number1String = number1 == nil ? "" : String(number1!)
                let number2String = number2 == nil ? "" : String(number2!)
                return "header: title: \(title) number: \(number1String) \(number2String)"

            case let .footer(title, number):
                let numberString = number == nil ? "" : String(number!)
                return "footer: title: \(title) number: \(numberString)"

            case .empty:
                return "EMPTY"
        }
    }
}

extension Tokens.FooterToken.Symbol: Printable {
    public var printStr: String {
        switch self {
            case let .total(title, number):
                return "total: title: \"\(title)\" number: \(number)"

            case let .expensesTotal(title, number):
                return "expensesTotal: title: \"\(title)\" number: \(number)"

            case let .openingBalance(title, number):
                return "openingBalance: title: \"\(title)\" number: \(number)"

            case let .balance(title, number1, number2):
                return "balance: title: \"\(title)\" number1: \(number1) number2: \(number2)"

            case .tbd:
                return "TBD"

            case .error:
                return "ERROR"
        }
    }
}

