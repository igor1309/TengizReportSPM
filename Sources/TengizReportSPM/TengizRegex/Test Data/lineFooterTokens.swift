//
//  lineFooterTokens.swift
//  TextViewAppUnitTests
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public struct LineFooterToken {
    public let line: String
    public let token: Tokens.FooterToken

    public init(line: String, token: Tokens.FooterToken) {
        self.line = line
        self.token = token
    }
}

public extension Tokens.FooterToken {
    static var allFooterTokens: [[Tokens.FooterToken]] {
        [LineFooterToken.lineFooterTokens202006,
         LineFooterToken.lineFooterTokens202007,
         LineFooterToken.lineFooterTokens202008,
         LineFooterToken.lineFooterTokens202009,
         LineFooterToken.lineFooterTokens202010,
         LineFooterToken.lineFooterTokens202011].map { $0.map(\.token) }
    }
}

public extension LineFooterToken {
    static var lineFooterTokens202006: [LineFooterToken] {
        [LineFooterToken(line: "ИТОГ всех расходов за месяц:    92.531р15к",
                         token: .expensesTotal("ИТОГ всех расходов за месяц", 92_531.15)),
         LineFooterToken(line: "Фактический остаток:    173.753     20%",
                         token: .balance("Фактический остаток", 173_753, 0.20))]
    }

    static var lineFooterTokens202007: [LineFooterToken] {
        [LineFooterToken(line: "ИТОГ всех расходов за месяц:    1.677.077р46к",
                         token: .expensesTotal("ИТОГ всех расходов за месяц", 1_677_077.46)),
         LineFooterToken(line: "Фактический остаток:    -609.230р46к    20%",
                         token: .balance("Фактический остаток", -609_230.46, 0.20)),
         LineFooterToken(line: "-173.753 остаток с июня",
                         token: .openingBalance("остаток с июня", -173_753)),
         LineFooterToken(line: "-28.000 субсидия, поступила в июле",
                         token: .tbd("-28.000 субсидия, поступила в июле")),
         LineFooterToken(line: "ИТОГ:    -407.477р46к",
                         token: .total("ИТОГ", -407_477.46))]
    }

    static var lineFooterTokens202008: [LineFooterToken] {
        [LineFooterToken(line: "ИТОГ всех расходов за месяц:    2.094.271р 36к",
                         token: .expensesTotal("ИТОГ всех расходов за месяц", 2_094_271.36)),
         LineFooterToken(line: "Фактический остаток:    -355.483р 36к    20%",
                         token: .balance("Фактический остаток", -355_483.36, 0.20)),
         LineFooterToken(line: "Минус с июля 407.477р 46к, переходит",
                         token: .openingBalance("Минус с июля 407.477р 46к, переходит", -407_477.46)),
         LineFooterToken(line: "+23.334р 76к остаток с инвестиций",
                         token: .tbd("+23.334р 76к остаток с инвестиций")),
         LineFooterToken(line: "ИТОГ:    -739.626р 06к",
                         token: .total("ИТОГ", -739_626.06))]
    }

    static var lineFooterTokens202009: [LineFooterToken] {
        [LineFooterToken(line: "ИТОГ всех расходов за месяц:    2.343.392р 37к",
                         token: .expensesTotal("ИТОГ всех расходов за месяц", 2_343_392.37)),
         LineFooterToken(line: "Фактический остаток:    96.628р 63к    20%",
                         token: .balance("Фактический остаток", 96_628.63, 0.20)),
         LineFooterToken(line: "Минус с августа переходит 739.626р 06к",
                         token: .openingBalance("Минус с августа переходит 739.626р 06к", -739_626.06)),
         LineFooterToken(line: "ИТОГ:    Минус 642.997р 43к",
                         token: .total("ИТОГ", -642_997.43))]
    }

    static var lineFooterTokens202010: [LineFooterToken] {
        [LineFooterToken(line: "",
                         token: .expensesTotal("ИТОГ всех расходов за месяц", 2_865_042.74)),
         LineFooterToken(line: "Фактический остаток:    Минус 277.306р 74к    20%",
                         token: .balance("Фактический остаток", -277_306.74, 0.20)),
         LineFooterToken(line: "Переходит минус с сентября 642.997р 43к",
                         token: .openingBalance("Переходит минус с сентября 642.997р 43к", -642_997.43)),
         LineFooterToken(line: "ИТОГ:    Минус 920.304р 17к",
                         token: .total("ИТОГ", -920_30417))]
    }

    static var lineFooterTokens202011: [LineFooterToken] {
        [LineFooterToken(line: "ИТОГ всех расходов за месяц:    2.030.572р59к",
                         token: .expensesTotal("ИТОГ всех расходов за месяц", 2_030_572.59)),
         LineFooterToken(line: "Фактический остаток",
                         token: .balance("Фактический остаток", -145_292.59, 0.20)),
         LineFooterToken(line: "Переходящий минус 920.304р 17к",
                         token: .openingBalance("Переходящий минус 920.304р 17к", -920_304.17)),
         LineFooterToken(line: "ИТОГ:    Минус 1.065.596р 76к",
                         token: .total("ИТОГ", -1_065_596.76))]
    }

}

