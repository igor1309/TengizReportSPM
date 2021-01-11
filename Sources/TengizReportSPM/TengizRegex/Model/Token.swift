//
//  Generic Token.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 11.01.2021.
//

import Foundation

public typealias HeaderSymbol = Tokens.HeaderToken.Symbol
public typealias BodySymbol = Tokens.BodyToken.Symbol
public typealias FooterSymbol = Tokens.FooterToken.Symbol

// MARK: - TokenSymbol

public protocol TokenSymbol: Equatable,
                             ExpressibleByStringLiteral where StringLiteralType == String {}

extension HeaderSymbol: TokenSymbol {}
extension BodySymbol: TokenSymbol {}
extension FooterSymbol: TokenSymbol {}

// MARK: - Token

public struct Token<Symbol: TokenSymbol>: Equatable {
    public let source: String
    public let symbol: Symbol

    public init(source: String, symbol: Symbol) {
        self.source = source
        self.symbol = symbol
    }
}

extension Token: ExpressibleByStringLiteral {
    public init(stringLiteral string: String) {
        self.init(source: string, symbol: Symbol(stringLiteral: string))
    }
}

public extension Token where Symbol == BodySymbol {
    static let empty = Token(source: "", symbol: .empty)
}
