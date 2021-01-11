//
//  Tokenize String+Ext.swift
//  TextViewApp
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public extension String {

    // MARK: - Tokenize Report Footer

    func reportFooter() -> [Token<FooterSymbol>] {
        self
            .cleanReport()
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map(Token<FooterSymbol>.init)
    }

}
