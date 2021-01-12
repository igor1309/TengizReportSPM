//
//  Numbers from String.swift
//  
//
//  Created by Igor Malyarov on 25.12.2020.
//

import Foundation

public extension String {

    // pattern to match numbers without rubliKopeiki
    static let itemNumberPattern =   #"\d{1,3}(?:\.\d{3})*"#
    static let rubliKopeikiPattern = #"\d{1,3}(\.\d{3})*р( \d\d?к)?"#
    static let kopeikiPatterm = #"((?<=р )\d\d?(?=к))"#
    static let minusPattern = #"(?:[М|м]инус\D*)|-(?=\d)"#

    // MARK: - helpers

    func numberAndRemains() -> (Double?, String) {
        var sign: Double = 1
        if self.firstMatch(for: String.minusPattern) != nil {
            sign = -1
        }

        if let numberString = self.firstMatch(for: String.rubliKopeikiPattern) {
            let rubliIKopeiki = numberString.rubliIKopeikiToDouble()
            if let remains = self.replaceFirstMatch(for: String.rubliKopeikiPattern, withString: "") {
                return (sign * rubliIKopeiki, remains)
            }
        }

        if let numberString = self.firstMatch(for: String.itemNumberPattern),
           let double = Double(numberString.replacingOccurrences(of: ".", with: "")),
           let remains = self.replaceFirstMatch(for: String.itemNumberPattern, withString: "") {
            return (sign * double, remains)
        }

        return (nil, self)
    }

    func numberWithSign() -> Double? {
        var sign: Double = 1
        if self.firstMatch(for: String.minusPattern) != nil {
            sign = -1
        }

        if let rubliIKopeikiString = self.firstMatch(for: String.rubliKopeikiPattern) {
            let rubliIKopeiki = rubliIKopeikiString.rubliIKopeikiToDouble()
            return sign * rubliIKopeiki
        }

        if let doubleString = self.firstMatch(for: String.itemNumberPattern),
           let double = Double(doubleString.replacingOccurrences(of: ".", with: "")) {
            return sign * double
        }

        return nil
    }

    // MARK: - Conversion

    func rubliIKopeikiToDouble() -> Double {
        guard let integerString = self.firstMatch(for: String.itemNumberPattern),
              let integer = Double(integerString.replaceMatches(for: #"\."#, withString: ""))
        else { return 0 }

        guard let decimalString = self.firstMatch(for: String.kopeikiPatterm),
              let decimal = Double(decimalString)
        else { return integer }

        return integer + decimal / 100
    }

    func percentageStringToDouble() -> Double? {
        guard self.last == "%",
              let percentage = Double(self.dropLast()) else { return nil }
        return percentage / 100
    }

    func numberWithoutSign() -> Double? {
        if let numberString = self.firstMatch(for: String.itemNumberPattern),
           let double = Double(numberString.replacingOccurrences(of: ".", with: "")) {
            return double
        }

        return nil
    }

}
