//
//  lineFooterTokens.swift
//  TextViewAppUnitTests
//
//  Created by Igor Malyarov on 05.01.2021.
//

import Foundation

public extension Token where Symbol == FooterSymbol {
    static var allFooterTokens: [[Token<FooterSymbol>]] {
        [footerTokens202006,
         footerTokens202007,
         footerTokens202008,
         footerTokens202009,
         footerTokens202010,
         footerTokens202011]//.flatMap { $0 }
    }

    static var footerTokens202006: [Token<FooterSymbol>] {
        [Token<FooterSymbol>(source: "ИТОГ всех расходов за месяц:\t92.531р 15к",
                             symbol: .expensesTotal("ИТОГ всех расходов за месяц", 92_531.15)),
         Token<FooterSymbol>(source: "Фактический остаток:\t173.753 \t20%",
                             symbol: .total(title: "Фактический остаток", value: 173_753, percentage: 0.20))]
    }

    static var footerTokens202007: [Token<FooterSymbol>] {
        [Token<FooterSymbol>(source: "ИТОГ всех расходов за месяц:\t1.677.077р 46к",
                             symbol: .expensesTotal("ИТОГ всех расходов за месяц", 1_677_077.46)),
         Token<FooterSymbol>(source: "Фактический остаток:\t-609.230р 46к\t20%",
                             symbol: .total(title: "Фактический остаток", value: -609_230.46, percentage: 0.20)),
         Token<FooterSymbol>(source: "-173.753 переходит остаток с июня",
                             symbol: .openingBalance(title: "-173.753 переходит остаток с июня", value: -173_753)),
         Token<FooterSymbol>(source: "-28.000 субсидия, поступила в июле",
                             symbol: .extraIncomeExpenses(title: "-28.000 субсидия, поступила в июле", value: -28_000)),
         Token<FooterSymbol>(source: "ИТОГ:\t-407.477р 46к",
                             symbol: .balance(title: "ИТОГ", value: -407_477.46))]
    }

    static var footerTokens202008: [Token<FooterSymbol>] {
        [Token<FooterSymbol>(source: "ИТОГ всех расходов за месяц:\t2.094.271р 36к",
                             symbol: .expensesTotal("ИТОГ всех расходов за месяц", 2_094_271.36)),
         Token<FooterSymbol>(source: "Фактический остаток:\t-355.483р 36к\t20%",
                             symbol: .total(title: "Фактический остаток", value: -355_483.36, percentage: 0.20)),
         Token<FooterSymbol>(source: "Минус с июля 407.477р 46к, переходит",
                             symbol: .openingBalance(title: "Минус с июля 407.477р 46к, переходит", value: -407_477.46)),
         Token<FooterSymbol>(source: "+23.334р 76к остаток с инвестиций",
                             symbol: .extraIncomeExpenses(title: "+23.334р 76к остаток с инвестиций", value: 23_334.76)),
         Token<FooterSymbol>(source: "ИТОГ:\t-739.626р 06к",
                             symbol: .balance(title: "ИТОГ", value: -739_626.06))]
    }

    static var footerTokens202009: [Token<FooterSymbol>] {
        [Token<FooterSymbol>(source: "ИТОГ всех расходов за месяц:\t2.343.392р 37к",
                             symbol: .expensesTotal("ИТОГ всех расходов за месяц", 2_343_392.37)),
         Token<FooterSymbol>(source: "Фактический остаток:\t96.628р 63к\t20%",
                             symbol: .total(title: "Фактический остаток", value: 96_628.63, percentage: 0.20)),
         Token<FooterSymbol>(source: "Минус с августа переходит 739.626р 06к",
                             symbol: .openingBalance(title: "Минус с августа переходит 739.626р 06к", value: -739_626.06)),
         Token<FooterSymbol>(source: "ИТОГ:\tМинус 642.997р 43к",
                             symbol: .balance(title: "ИТОГ", value: -642_997.43))]
    }

    static var footerTokens202010: [Token<FooterSymbol>] {
        [Token<FooterSymbol>(source: "ИТОГ всех расходов за месяц:\t2.865.042р 74к",
                             symbol: .expensesTotal("ИТОГ всех расходов за месяц", 2_865_042.74)),
         Token<FooterSymbol>(source: "Фактический остаток:\tМинус 277.306р 74к\t20%",
                             symbol: .total(title: "Фактический остаток", value: -277_306.74, percentage: 0.20)),
         Token<FooterSymbol>(source: "Переходит минус с сентября 642.997р 43к",
                             symbol: .openingBalance(title: "Переходит минус с сентября 642.997р 43к", value: -642_997.43)),
         Token<FooterSymbol>(source: "ИТОГ:\tМинус 920.304р 17к",
                             symbol: .balance(title: "ИТОГ", value: -920_304.17))]
    }

    static var footerTokens202011: [Token<FooterSymbol>] {
        [Token<FooterSymbol>(source: "ИТОГ всех расходов за месяц:\t2.030.572р 59к",
                             symbol: .expensesTotal("ИТОГ всех расходов за месяц", 2_030_572.59)),
         Token<FooterSymbol>(source: "Фактический остаток:\tМинус 145.292р 59к\t20%",
                             symbol: .total(title: "Фактический остаток", value: -145_292.59, percentage: 0.20)),
         Token<FooterSymbol>(source: "Переходящий минус 920.304р 17к",
                             symbol: .openingBalance(title: "Переходящий минус 920.304р 17к", value: -920_304.17)),
         Token<FooterSymbol>(source: "ИТОГ:\tМинус 1.065.596р 76к",
                             symbol: .balance(title: "ИТОГ", value: -1_065_596.76))]
    }

}
