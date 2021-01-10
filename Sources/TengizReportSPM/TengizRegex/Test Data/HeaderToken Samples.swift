//
//  HeaderToken Samples.swift
//  TextViewAppUnitTests
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public extension Tokens.HeaderToken {
    static var allHeaderTokens: [Tokens.HeaderToken] {
        [headerTokens202006,
         headerTokens202007,
         headerTokens202008,
         headerTokens202009,
         headerTokens202010,
         headerTokens202011].flatMap { $0 }
    }

    static var headerTokens202006: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nМесяц: июнь2020 (с 24 по 30 июня)\tОборот:266.285\tСредний показатель: 38.040\n", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nМесяц: июнь2020 (с 24 по 30 июня)\tОборот:266.285\tСредний показатель: 38.040\n", symbol: .month(monthStr: "июнь2020")),
         Tokens.HeaderToken(source: "Оборот:266.285", symbol: .item(title: "Оборот", value: 266285.0)),
         Tokens.HeaderToken(source: "Средний показатель: 38.040", symbol: .item(title: "Средний показатель", value: 38040.0))
        ]
    }

    static var headerTokens202007: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nМесяц: июль2020 \tОборот:1.067.807\tСредний показатель: 34.445\n", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nМесяц: июль2020 \tОборот:1.067.807\tСредний показатель: 34.445\n", symbol: .month(monthStr: "июль2020")),
         Tokens.HeaderToken(source: "Оборот:1.067.807", symbol: .item(title: "Оборот", value: 1067807.0)),
         Tokens.HeaderToken(source: "Средний показатель: 34.445", symbol: .item(title: "Средний показатель", value: 34445.0))
        ]
    }

    static var headerTokens202008: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nМесяц: август2020 \tОборот:1.738.788\tСредний показатель: 56.089\n", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nМесяц: август2020 \tОборот:1.738.788\tСредний показатель: 56.089\n", symbol: .month(monthStr: "август2020")),
         Tokens.HeaderToken(source: "Оборот:1.738.788", symbol: .item(title: "Оборот", value: 1738788.0)),
         Tokens.HeaderToken(source: "Средний показатель: 56.089", symbol: .item(title: "Средний показатель", value: 56089.0))
        ]
    }

    static var headerTokens202009: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nМесяц: сентябрь2020 \tОборот:2.440.021\tСредний показатель: 81.334\n", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nМесяц: сентябрь2020 \tОборот:2.440.021\tСредний показатель: 81.334\n", symbol: .month(monthStr: "сентябрь2020")),
         Tokens.HeaderToken(source: "Оборот:2.440.021", symbol: .item(title: "Оборот", value: 2440021.0)),
         Tokens.HeaderToken(source: "Средний показатель: 81.334", symbol: .item(title: "Средний показатель", value: 81334.0))
        ]
    }

    static var headerTokens202010: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nОктябрь2020 \tОборот:2.587.735\tСредний показатель: 83.475\n", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nОктябрь2020 \tОборот:2.587.735\tСредний показатель: 83.475\n", symbol: .month(monthStr: "Октябрь2020")),
         Tokens.HeaderToken(source: "Оборот:2.587.735", symbol: .item(title: "Оборот", value: 2587735.0)),
         Tokens.HeaderToken(source: "Средний показатель: 83.475", symbol: .item(title: "Средний показатель", value: 83475.0))
        ]
    }

    static var headerTokens202011: [Tokens.HeaderToken] {
        [Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nНоябрь2020 \tОборот:1.885.280\tСредний показатель: 62.842\n", symbol: .company(name: "Саперави Аминьевка")),
         Tokens.HeaderToken(source: "Название объекта: Саперави Аминьевка\nНоябрь2020 \tОборот:1.885.280\tСредний показатель: 62.842\n", symbol: .month(monthStr: "Ноябрь2020")),
         Tokens.HeaderToken(source: "Оборот:1.885.280", symbol: .item(title: "Оборот", value: 1885280.0)),
         Tokens.HeaderToken(source: "Средний показатель: 62.842", symbol: .item(title: "Средний показатель", value: 62842.0))
        ]
    }


}

