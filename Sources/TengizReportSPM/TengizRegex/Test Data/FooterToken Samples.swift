//
//  lineFooterTokens.swift
//  TextViewAppUnitTests
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public extension Tokens.FooterToken {
    static var allFooterTokens: [[Tokens.FooterToken]] {
        [Tokens.FooterToken.footerTokens202006,
         Tokens.FooterToken.footerTokens202007,
         Tokens.FooterToken.footerTokens202008,
         Tokens.FooterToken.footerTokens202009,
         Tokens.FooterToken.footerTokens202010,
         Tokens.FooterToken.footerTokens202011]//.flatMap { $0 }
    }

    static var footerTokens202006: [Tokens.FooterToken] {
        [Tokens.FooterToken(source: "ИТОГ всех расходов за месяц:\t92.531р 15к",
                            symbol: .expensesTotal("ИТОГ всех расходов за месяц", 92_531.15)),
         Tokens.FooterToken(source: "Фактический остаток:\t173.753 \t20%",
                            symbol: .balance("Фактический остаток", 173_753, 0.20))]
    }
    
    static var footerTokens202007: [Tokens.FooterToken] {
        [Tokens.FooterToken(source: "ИТОГ всех расходов за месяц:\t1.677.077р 46к",
                            symbol: .expensesTotal("ИТОГ всех расходов за месяц", 1_677_077.46)),
         Tokens.FooterToken(source: "Фактический остаток:\t-609.230р 46к\t20%",
                            symbol: .balance("Фактический остаток", -609_230.46, 0.20)),
         Tokens.FooterToken(source: "-173.753 остаток с июня",
                            symbol: .openingBalance("остаток с июня", -173_753)),
         Tokens.FooterToken(source: "-28.000 субсидия, поступила в июле",
                            symbol: .tbd),
         Tokens.FooterToken(source: "ИТОГ:\t-407.477р 46к",
                            symbol: .total("ИТОГ", -407_477.46))]
    }
    
    static var footerTokens202008: [Tokens.FooterToken] {
        [Tokens.FooterToken(source: "ИТОГ всех расходов за месяц:\t2.094.271р 36к",
                            symbol: .expensesTotal("ИТОГ всех расходов за месяц", 2_094_271.36)),
         Tokens.FooterToken(source: "Фактический остаток:\t-355.483р 36к\t20%",
                            symbol: .balance("Фактический остаток", -355_483.36, 0.20)),
         Tokens.FooterToken(source: "Минус с июля 407.477р 46к, переходит",
                            symbol: .openingBalance("Минус с июля 407.477р 46к, переходит", -407_477.46)),
         Tokens.FooterToken(source: "+23.334р 76к остаток с инвестиций",
                            symbol: .tbd),
         Tokens.FooterToken(source: "ИТОГ:\t-739.626р 06к",
                            symbol: .total("ИТОГ", -739_626.06))]
    }
    
    static var footerTokens202009: [Tokens.FooterToken] {
        [Tokens.FooterToken(source: "ИТОГ всех расходов за месяц:\t2.343.392р 37к",
                            symbol: .expensesTotal("ИТОГ всех расходов за месяц", 2_343_392.37)),
         Tokens.FooterToken(source: "Фактический остаток:\t96.628р 63к\t20%",
                            symbol: .balance("Фактический остаток", 96_628.63, 0.20)),
         Tokens.FooterToken(source: "Минус с августа переходит 739.626р 06к",
                            symbol: .openingBalance("Минус с августа переходит 739.626р 06к", -739_626.06)),
         Tokens.FooterToken(source: "ИТОГ:\tМинус 642.997р 43к",
                            symbol: .total("ИТОГ", -642_997.43))]
    }
    
    static var footerTokens202010: [Tokens.FooterToken] {
        [Tokens.FooterToken(source: "ИТОГ всех расходов за месяц:\t2.865.042р 74к",
                            symbol: .expensesTotal("ИТОГ всех расходов за месяц", 2_865_042.74)),
         Tokens.FooterToken(source: "Фактический остаток:\tМинус 277.306р 74к\t20%",
                            symbol: .balance("Фактический остаток", -277_306.74, 0.20)),
         Tokens.FooterToken(source: "Переходит минус с сентября 642.997р 43к",
                            symbol: .openingBalance("Переходит минус с сентября 642.997р 43к", -642_997.43)),
         Tokens.FooterToken(source: "ИТОГ:\tМинус 920.304р 17к",
                            symbol: .total("ИТОГ", -920_304.17))]
    }
    
    static var footerTokens202011: [Tokens.FooterToken] {
        [Tokens.FooterToken(source: "ИТОГ всех расходов за месяц:\t2.030.572р 59к",
                            symbol: .expensesTotal("ИТОГ всех расходов за месяц", 2_030_572.59)),
         Tokens.FooterToken(source: "Фактический остаток:\tМинус 145.292р 59к\t20%",
                            symbol: .balance("Фактический остаток", -145_292.59, 0.20)),
         Tokens.FooterToken(source: "Переходящий минус 920.304р 17к",
                            symbol: .openingBalance("Переходящий минус 920.304р 17к", -920_304.17)),
         Tokens.FooterToken(source: "ИТОГ:\tМинус 1.065.596р 76к",
                            symbol: .total("ИТОГ", -1_065_596.76))]
    }
    
}

