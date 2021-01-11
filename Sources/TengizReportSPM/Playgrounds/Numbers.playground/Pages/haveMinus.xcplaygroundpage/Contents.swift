import Foundation
import TengizReportSPM

// #####################################################################
// MARK: Тенгиз вольно использует минус
//       нужно внимательно сканировать контекст для правильного парсинга
// #####################################################################

/// all rows from all reports, that are significant: excluding rows like "5. Тайный гость    -----------------------------"
let cleanRows = try filenames
    .flatMap {
        try $0
            .contentsOf()
            .cleanReport()
            .split(separator: "\n")
            .map { String($0) }
            .filter {
                $0.firstMatch(for: String.itemFullLineWithoutDigitsPattern) == nil
            }
    }

print(String(repeating: "-", count: 40) + " all rows from all reports, that are significant:")
cleanRows.forEach { print($0) }

var haveMinus = cleanRows.filter {
    $0.firstMatch(for: String.minusPattern) != nil
}
print(String(repeating: "-", count: 40) + " Rows from all reports with minus:")
haveMinus.forEach { print($0) }
print(String(repeating: "#", count: 120))

var notHaveMinus = cleanRows.filter {
    $0.firstMatch(for: String.minusPattern) == nil
}
print(String(repeating: "-", count: 40) + " Rows from all reports without minus:")
notHaveMinus.forEach { print($0) }
print(String(repeating: "#", count: 120))
