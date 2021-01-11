//
//  TokenizeReportHeader.swift
//  
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public extension String {
    static let delimiter = "$$$$$"
}

public extension String {

    // MARK: - Tokenize Report Header

    func reportHeader() -> [Token<HeaderSymbol>] {
        self.cleanReport()
            .replaceMatches(for: #"\t"#, withString: String.delimiter)
            .replaceMatches(for: #"\n"#, withString: String.delimiter)
            .components(separatedBy: String.delimiter)
            .filter { !$0.isEmpty }
            .map(Token<HeaderSymbol>.init)
    }

}
