import Foundation
import TengizReportSPM

func printCleanReports() throws {
    try filenames
        .map {
            try $0
                .contentsOfFile()
                .cleanReport()
        }
        .forEach { print($0) }
}
try printCleanReports()

func printReportsAsIs() throws {
    try filenames
        .map { try $0.contentsOfFile() }
        .forEach { print($0) }
}
try printReportsAsIs()
