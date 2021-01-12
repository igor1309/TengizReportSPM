import Foundation
import TengizReportSPM

try filenames
    .map { contents in
        try contents
            .contentsOfFile()
            .reportContent()
            .header
    }
    .forEach {
        print($0)
        print(String(repeating: "-", count: 80))
    }
