//
//  Tokens.swift
//  TextViewApp
//
//  Created by Igor Malyarov on 29.12.2020.
//

import Foundation

public protocol TokenSymbol {}
extension Tokens.HeaderToken.Symbol: TokenSymbol {}
extension Tokens.BodyToken.Symbol: TokenSymbol {}
extension Tokens.FooterToken.Symbol: TokenSymbol {}

public struct Token<Symbol: TokenSymbol> {
    public let source: String
    public let symbol: Symbol

    public init(source: String, symbol: Symbol) {
        self.source = source
        self.symbol = symbol
    }
}

public extension Token where Symbol == Tokens.BodyToken.Symbol {
    static let empty = Token(source: "", symbol: .empty)
}

public enum Tokens {

    public struct HeaderToken: Equatable {
        public let source: String
        public let symbol: Symbol

        public enum Symbol: Hashable, Equatable {
            case company(name: String)
            case month(monthStr: String)
            case item(title: String, value: Double)
            case error
        }

        public init(source: String, symbol: Symbol) {
            self.source = source
            self.symbol = symbol
        }
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

        public init(source: String, symbol: Symbol) {
            self.source = source
            self.symbol = symbol
        }
    }

}
