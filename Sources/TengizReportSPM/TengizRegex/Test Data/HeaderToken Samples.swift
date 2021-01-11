//
//  HeaderToken Samples.swift
//  TextViewAppUnitTests
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public extension Token where Symbol == HeaderSymbol {
    static var allHeaderTokens: [[Token<HeaderSymbol>]] {
        [headerTokens202006,
         headerTokens202007,
         headerTokens202008,
         headerTokens202009,
         headerTokens202010,
         headerTokens202011,
        ]
    }

    static var headerTokens202006: [Token<HeaderSymbol>] {
        [Token<HeaderSymbol>(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Token<HeaderSymbol>(source: "Месяц: июнь2020 (с 24 по 30 июня)", symbol: .month(monthStr: "июнь2020")),
         Token<HeaderSymbol>(source: "Оборот:266.285", symbol: .item(title: "Оборот", value: 266285.0)),
         Token<HeaderSymbol>(source: "Средний показатель: 38.040", symbol: .item(title: "Средний показатель", value: 38040.0)),
        ]
    }

    static var headerTokens202007: [Token<HeaderSymbol>] {
        [Token<HeaderSymbol>(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Token<HeaderSymbol>(source: "Месяц: июль2020 ", symbol: .month(monthStr: "июль2020")),
         Token<HeaderSymbol>(source: "Оборот:1.067.807", symbol: .item(title: "Оборот", value: 1067807.0)),
         Token<HeaderSymbol>(source: "Средний показатель: 34.445", symbol: .item(title: "Средний показатель", value: 34445.0)),
        ]
    }

    static var headerTokens202008: [Token<HeaderSymbol>] {
        [Token<HeaderSymbol>(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Token<HeaderSymbol>(source: "Месяц: август2020 ", symbol: .month(monthStr: "август2020")),
         Token<HeaderSymbol>(source: "Оборот:1.738.788", symbol: .item(title: "Оборот", value: 1738788.0)),
         Token<HeaderSymbol>(source: "Средний показатель: 56.089", symbol: .item(title: "Средний показатель", value: 56089.0)),
        ]
    }

    static var headerTokens202009: [Token<HeaderSymbol>] {
        [Token<HeaderSymbol>(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Token<HeaderSymbol>(source: "Месяц: сентябрь2020 ", symbol: .month(monthStr: "сентябрь2020")),
         Token<HeaderSymbol>(source: "Оборот:2.440.021", symbol: .item(title: "Оборот", value: 2440021.0)),
         Token<HeaderSymbol>(source: "Средний показатель: 81.334", symbol: .item(title: "Средний показатель", value: 81334.0)),
        ]
    }

    static var headerTokens202010: [Token<HeaderSymbol>] {
        [Token<HeaderSymbol>(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Token<HeaderSymbol>(source: "Октябрь2020 ", symbol: .month(monthStr: "Октябрь2020")),
         Token<HeaderSymbol>(source: "Оборот:2.587.735", symbol: .item(title: "Оборот", value: 2587735.0)),
         Token<HeaderSymbol>(source: "Средний показатель: 83.475", symbol: .item(title: "Средний показатель", value: 83475.0)),
        ]
    }

    static var headerTokens202011: [Token<HeaderSymbol>] {
        [Token<HeaderSymbol>(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Token<HeaderSymbol>(source: "Ноябрь2020 ", symbol: .month(monthStr: "Ноябрь2020")),
         Token<HeaderSymbol>(source: "Оборот:1.885.280", symbol: .item(title: "Оборот", value: 1885280.0)),
         Token<HeaderSymbol>(source: "Средний показатель: 62.842", symbol: .item(title: "Средний показатель", value: 62842.0)),
        ]
    }

}


public extension Tokens.HeaderToken {
    static var allHeaderTokens: [[Tokens.HeaderToken]] {
        [headerTokens202006,
         headerTokens202007,
         headerTokens202008,
         headerTokens202009,
         headerTokens202010,
         headerTokens202011]//.flatMap { $0 }
    }

    static var headerTokens202006: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Месяц: июнь2020 (с 24 по 30 июня)", symbol: .month(monthStr: "июнь2020")),
         Tokens.HeaderToken(source: "Оборот:266.285", symbol: .item(title: "Оборот", value: 266285.0)),
         Tokens.HeaderToken(source: "Средний показатель: 38.040", symbol: .item(title: "Средний показатель", value: 38040.0)),
        ]
    }

    static var headerTokens202007: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Месяц: июль2020 ", symbol: .month(monthStr: "июль2020")),
         Tokens.HeaderToken(source: "Оборот:1.067.807", symbol: .item(title: "Оборот", value: 1067807.0)),
         Tokens.HeaderToken(source: "Средний показатель: 34.445", symbol: .item(title: "Средний показатель", value: 34445.0)),
        ]
    }

    static var headerTokens202008: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Месяц: август2020 ", symbol: .month(monthStr: "август2020")),
         Tokens.HeaderToken(source: "Оборот:1.738.788", symbol: .item(title: "Оборот", value: 1738788.0)),
         Tokens.HeaderToken(source: "Средний показатель: 56.089", symbol: .item(title: "Средний показатель", value: 56089.0)),
        ]
    }

    static var headerTokens202009: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Месяц: сентябрь2020 ", symbol: .month(monthStr: "сентябрь2020")),
         Tokens.HeaderToken(source: "Оборот:2.440.021", symbol: .item(title: "Оборот", value: 2440021.0)),
         Tokens.HeaderToken(source: "Средний показатель: 81.334", symbol: .item(title: "Средний показатель", value: 81334.0)),
        ]
    }

    static var headerTokens202010: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Октябрь2020 ", symbol: .month(monthStr: "Октябрь2020")),
         Tokens.HeaderToken(source: "Оборот:2.587.735", symbol: .item(title: "Оборот", value: 2587735.0)),
         Tokens.HeaderToken(source: "Средний показатель: 83.475", symbol: .item(title: "Средний показатель", value: 83475.0)),
        ]
    }

    static var headerTokens202011: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Ноябрь2020 ", symbol: .month(monthStr: "Ноябрь2020")),
         Tokens.HeaderToken(source: "Оборот:1.885.280", symbol: .item(title: "Оборот", value: 1885280.0)),
         Tokens.HeaderToken(source: "Средний показатель: 62.842", symbol: .item(title: "Средний показатель", value: 62842.0)),
        ]
    }

}

