//
//  Regex Patterns.swift
//  
//
//  Created by Igor Malyarov on 25.12.2020.
//

import Foundation

public extension String {

    // MARK: - Regular Expression Patterns

    ///  (?m) - MULTILINE mode on
    // static let groupPattern = #"(?m)^[А-Яа-я][^\n]*\n(^\d\d?\..*\n+)+ИТОГ:.*"#
    private static let groupHeaderPattern = #"^[А-Яа-я][^\n]*\n"#
    private static let itemLine = #"(^\d\d?\..*\n+)"#
    /// matching lines like `"-10.000 за перерасход питание персонала в июле"`
    static let itemCorrectionLine = #"^-\d{1,3}(?:\.\d{3})*.*"#
    static let groupPattern = #"(?m)"# + groupHeaderPattern + #"("# + itemLine + #"|("# + itemCorrectionLine + #"\n))+ИТОГ:.*"#
    /// matching lines starting like "3. Электричество" or "12.Интернет"
    static let itemTitlePattern = #"^[1-9]\d?\.[^\d\n]+"#
    static let itemFullLineWithDigitsPattern = #"(?m)"# + itemTitlePattern + #"\d+.*"#
    /// rows without digits except for line number
    static let itemFullLineWithoutDigitsPattern = #"(?m)^[1-9]\d?\.\D*$"#
    /// matching lines like `"4.Банковская комиссия 1.6% за эквайринг    "` (mind whitespace)
    static let itemTitleWithPercentagePattern =  itemTitlePattern + percentagePattern + #"[\D]*"#
    // static let itemTitleWithPercentagePattern =  #"^[1-9]\d?\.[\D]*\d+(\.\d+)?%[\D]*"#
    /// matching lines like `"22. Хэдхантер (подбор пероснала)    "` (mind whitespace)
    static let itemTitleWithParenthesesPattern = itemTitlePattern + #"\([^(]*\)[^\d\n]*"#
    static let itemWithPlusPattern = itemTitlePattern + numbersWithPlusPattern
    /// pattern to match `"200.000 (за август) +400.000 (за сентябрь)"` or `"7.701+4.500"`
    static let numbersWithPlusPattern = itemNumberPattern + #"(?:\s*\([^\)]+\)\s*)?\+"# + itemNumberPattern + #"(?:\s*\([^\)]+\)\s*)?"#
    static let groupHeaderFooterTitlePattern = #"^[А-Яа-я][А-Яа-я ]+(?=:)"#
    static let percentagePattern = #"\d+(\.\d+)?%"#

}
