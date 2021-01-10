//
//  Tokens.swift
//  TextViewApp
//
//  Created by Igor Malyarov on 29.12.2020.
//

import Foundation

public typealias HeaderSymbol = Tokens.HeaderToken.Symbol
public typealias BodySymbol = Tokens.BodyToken.Symbol
public typealias FooterSymbol = Tokens.FooterToken.Symbol

public protocol TokenSymbol {}
extension HeaderSymbol: TokenSymbol {}
extension BodySymbol: TokenSymbol {}
extension FooterSymbol: TokenSymbol {}

public struct Token<Symbol: TokenSymbol> {
    public let source: String
    public let symbol: Symbol

    public init(source: String, symbol: Symbol) {
        self.source = source
        self.symbol = symbol
    }
}

public protocol StringInitializable {
    init(string: String)
}

extension Token: StringInitializable where Symbol: StringInitializable {
    public init(string: String) {
        self.init(source: string, symbol: Symbol(string: string))
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
