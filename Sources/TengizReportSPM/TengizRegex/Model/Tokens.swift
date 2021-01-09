//
//  Tokens.swift
//  TextViewApp
//
//  Created by Igor Malyarov on 29.12.2020.
//

import Foundation

public enum Tokens {

    public enum HeaderToken: Hashable {
        case company(source: String, name: String)
        case month(source: String, monthStr: String)
        case item(source: String, title: String, value: Double)
        case error(source: String)
    }

    public struct BodyToken: Equatable {
        public let source: String
        public let symbol: Symbol

        public enum Symbol: Hashable, Equatable {
            case item(title: String, value: Double, comment: String?)
            case header(title: String, value: Double?, percentage: Double?)
            case footer(title: String, value: Double?)
            case empty
        }

        public static let empty = BodyToken(source: "", symbol: .empty)
    }

    public struct FooterToken: Equatable {
        public let source: String
        public let symbol: Symbol

        public enum Symbol: Hashable, Equatable {
            case total(String, Double)
            case expensesTotal(String, Double)
            case openingBalance(String, Double)
            case balance(String, Double, Double)
            case tbd
            case error
        }
    }

}

extension Tokens.HeaderToken: Equatable {}

public extension Tokens.HeaderToken {
//    var source: String {
//        // MARK: - full header string is present in .company() token
//        switch token {
//            case let .company(source, _):
//                return source
//            default: return nil
//        }
//    }

    var printStr: String {
        switch self {
            case let .company(source, name):
                return "source: \"\(source)\"\ncompany: \"\(name)\""

            case let .month(source, month):
                return "source: \"\(source)\"\nmonth: \"\(month)\""

            case let .item(source, title, value):
                return "source: \"\(source)\"\n\"\(title)\": \(value)"

            case .error(let source):
                return "source: \"\(source)\"\n"
        }
    }
}

public extension Tokens.BodyToken.Symbol {
    var printStr: String {
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

public extension Tokens.FooterToken.Symbol {
    var printStr: String {
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

