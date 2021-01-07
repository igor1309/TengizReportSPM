//
//  lineHeaderTokens.swift
//  TextViewAppUnitTests
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public struct LineHeaderToken {
    public let line: String
    public let token: Tokens.HeaderToken

    public init(line: String, token: Tokens.HeaderToken) {
        self.line = line
        self.token = token
    }
}

public extension Tokens.HeaderToken {
    static var allHeaderTokens: [Tokens.HeaderToken] {
        [LineHeaderToken.lineHeaderTokens202006,
         LineHeaderToken.lineHeaderTokens202007,
         LineHeaderToken.lineHeaderTokens202008,
         LineHeaderToken.lineHeaderTokens202009,
         LineHeaderToken.lineHeaderTokens202010,
         LineHeaderToken.lineHeaderTokens202011].map { $0.map(\.token) }.flatMap { $0 }
    }
}

public extension LineHeaderToken {
    static var allLineHeaderTokens: [LineHeaderToken] {
        [LineHeaderToken.lineHeaderTokens202006,
         LineHeaderToken.lineHeaderTokens202007,
         LineHeaderToken.lineHeaderTokens202008,
         LineHeaderToken.lineHeaderTokens202009,
         LineHeaderToken.lineHeaderTokens202010,
         LineHeaderToken.lineHeaderTokens202011].flatMap { $0 }
    }

    static var lineHeaderTokens202006: [LineHeaderToken] {
        [LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                         token: .company("Саперави Аминьевка")),
         LineHeaderToken(line: "Месяц: июнь2020 (с 24 по 30 июня)",
                         token: .month("июнь2020")),
         LineHeaderToken(line: "Оборот:266.285",
                         token: .headerItem("Оборот", 266_285)),
         LineHeaderToken(line: "Средний показатель: 83.475",
                         token: .headerItem("Средний показатель", 38_040))]
    }

    static var lineHeaderTokens202007: [LineHeaderToken] {
        [LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                         token: .company("Саперави Аминьевка")),
         LineHeaderToken(line: "Месяц: июль2020",
                         token: .month("июль2020")),
         LineHeaderToken(line: "Оборот:1.067.807",
                         token: .headerItem("Оборот", 1_067_807)),
         LineHeaderToken(line: "Средний показатель: 83.475",
                         token: .headerItem("Средний показатель", 34_445))]
    }

    static var lineHeaderTokens202008: [LineHeaderToken] {
        [LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                         token: .company("Саперави Аминьевка")),
         LineHeaderToken(line: "Месяц: август2020",
                         token: .month("август2020")),
         LineHeaderToken(line: "Оборот:1.738.788",
                         token: .headerItem("Оборот", 1_738_788)),
         LineHeaderToken(line: "Средний показатель: 83.475",
                         token: .headerItem("Средний показатель", 56_089))]
    }

    static var lineHeaderTokens202009: [LineHeaderToken] {
        [LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                         token: .company("Саперави Аминьевка")),
         LineHeaderToken(line: "Месяц: сентябрь2020",
                         token: .month("сентябрь2020")),
         LineHeaderToken(line: "Оборот:2.440.021",
                         token: .headerItem("Оборот", 2_440_021)),
         LineHeaderToken(line: "Средний показатель: 83.475",
                         token: .headerItem("Средний показатель", 81_334))]
    }

    static var lineHeaderTokens202010: [LineHeaderToken] {
        [LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                         token: .company("Саперави Аминьевка")),
         LineHeaderToken(line: "Октябрь2020",
                         token: .month("Октябрь2020")),
         LineHeaderToken(line: "Оборот:2.587.735",
                         token: .headerItem("Оборот", 2_587_735)),
         LineHeaderToken(line: "Средний показатель: 83.475",
                         token: .headerItem("Средний показатель", 83_475))]
    }

    static var lineHeaderTokens202011: [LineHeaderToken] {
        [LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                         token: .company("Саперави Аминьевка")),
         LineHeaderToken(line: "Ноябрь2020",
                         token: .month("Ноябрь2020")),
         LineHeaderToken(line: "Оборот:1.885.280",
                         token: .headerItem("Оборот", 1_885_280)),
         LineHeaderToken(line: "Средний показатель: 83.475",
                         token: .headerItem("Средний показатель", 62_842))]
    }

}

