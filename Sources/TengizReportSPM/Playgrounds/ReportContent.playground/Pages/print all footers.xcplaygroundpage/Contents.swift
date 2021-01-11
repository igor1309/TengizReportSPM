import Foundation
import TengizReportSPM

// 1
ReportContent.sampleContents
    .map(\.footer)
    .forEach {
        print($0)
        print(String(repeating: "-", count: 60))
    }

// 2
try filenames
    .map {
        try $0
            .contentsOf()
            .splitReportContent()
            .footer
    }
    .forEach {
        debugPrint($0)
        print(String(repeating: "-", count: 80))
    }
