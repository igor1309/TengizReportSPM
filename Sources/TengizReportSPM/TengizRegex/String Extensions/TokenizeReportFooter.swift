//
//  Tokenize String+Ext.swift
//  TextViewApp
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public extension String {

    // MARK: - Tokenize Report Footer

    func tokenizeReportFooter() -> [Tokens.FooterToken] {
        self
            .cleanReport()
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map(Tokens.FooterToken.init)
    }

    func tokenizeReportFooterGENERIC() -> [Token<FooterSymbol>] {
        self
            .cleanReport()
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map(Token<FooterSymbol>.init)
    }

}
