import Foundation
import TengizReportSPM

func printCleanReports() throws {
    try filenames
        .map {
            try $0
                .contentsOf()
                .cleanReport()
        }
        .forEach { print($0) }
}
try printCleanReports()

func printReportsAsIs() throws {
    try filenames
        .map { try $0.contentsOf() }
        .forEach { print($0) }
}
try printReportsAsIs()
