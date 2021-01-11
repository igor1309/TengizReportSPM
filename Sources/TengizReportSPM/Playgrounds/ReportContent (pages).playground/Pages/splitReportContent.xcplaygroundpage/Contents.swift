import Foundation
//import XCTest
import TengizReportSPM

["yes ", " "].sameAs(["yes  ", "  "])

// working with raw text as is - no text tweaks
func testSplitReportContent() {
    for (filename, reportContent) in zip(filenames, ReportContent.sampleContents) {
        guard let contents = try? filename.contentsOf() else {
            print("ERROR reading report file in bundle")
            return
        }
        // print([contents])
        let rContent = contents.reportContent()

        //print(rContent.printStr)

        if rContent == reportContent {
            // if rContent.sameAs(reportContent) {
            print("Report Content split OK")
        } else {
            print("ERROR splitting Report Content")

            let header = rContent.header
            let sampleHeader = reportContent.header

            if header.sameAs(sampleHeader) {
                print("Header Split OK")
            } else {
                print(String(repeating: "-", count: 60), "ERROR splitting Header")
                print("HAVE:", header)
                print(String(repeating: "#", count: 120))
                print("WANT:", sampleHeader)
                print(String(repeating: "#", count: 120))
            }

            if rContent.body.sameAs(reportContent.body) {
                print("Body Split OK")
            } else {
                print(String(repeating: "-", count: 60), "ERROR splitting Body")

                for (group, sample) in zip(rContent.body, reportContent.body) {
                    if group.sameAs(sample) {
                        print("Same Group")
                        print(String(repeating: "#", count: 120))
                    } else {
                        print("HAVE:", [group.replaceMatches(for: #"\s+"#, withString: " ")])
                        print(String(repeating: "-", count: 120))
                        print("WANT:", [sample.replaceMatches(for: #"\s+"#, withString: " ")])
                        print(String(repeating: "#", count: 120))
                    }
                }
            }

            let footer = rContent.footer
            let sampleFooter = reportContent.footer

            if footer.sameAs(sampleFooter) {
                print("Footer Split OK")
            } else {
                print(String(repeating: "-", count: 60), "ERROR splitting Footer")
                print("HAVE:", footer)
                print(String(repeating: "#", count: 120))
                print("WANT:", sampleFooter)
                print(String(repeating: "#", count: 120))
            }
        }

        //XCTAssertEqual(contents.reportContent(), reportContent)
        //print(contents.reportContent().printStr)
    }
}
testSplitReportContent()
