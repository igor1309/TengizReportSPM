import Foundation
import TengizReportSPM

// MARK: checking itemFullLineWithoutDigitsPattern

let haveNoDigits = try filenames
    .flatMap {
        try $0
            .contentsOfFile()
            .cleanReport()
            .split(separator: "\n")
            .map { String($0) }
            .filter {
                $0.firstMatch(for: Patterns.itemFullLineWithoutDigits) != nil
            }
    }

print(String(repeating: "-", count: 40) + " Rows from all reports without digits except for line start:")
haveNoDigits.forEach { print($0) }
//print(String(repeating: "#", count: 120))
