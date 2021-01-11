import Foundation
import TengizReportSPM

try filenames
    .map { contents in
        try contents
            .contentsOf()
            .reportContent()
            .header
    }
    .forEach {
        print($0)
        print(String(repeating: "-", count: 80))
    }
