import XCTest
@testable import TengizReportSPM

final class TengizReportSPMTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TengizReportSPM().text, "Hello, World!")
    }

    enum TestErrors: Error {
        case noFile(String)
        // case noFileContent(String)
    }

    func contentsOf(_ filename: String) throws -> String {
        guard let filepath = Bundle.module.path(forResource: filename, ofType: "txt") else { throw TestErrors.noFile(filename) }
        return try String(contentsOfFile: filepath)
    }

    func testTengizReportSPMReportTextFilessReadable() throws {
        for filename in filenames {
            let contents = try contentsOf(filename)
            XCTAssertNotEqual(contents, "", "Report file content is empty")
        }
    }

    func testSplitReportContent() throws {
        let sampleContents = ReportContent.sampleContents

        for (filename, report) in zip(filenames, sampleContents) {
            let contents = try contentsOf(filename)
            let reportContent = contents.splitReportContent()

            XCTAssertFalse(reportContent.hasError, "Errors in splitting report content")
            XCTAssertNotEqual(reportContent.headerString, "", "Header is empty")
            XCTAssertEqual(reportContent.headerString, report.headerString, "Header split error")
            XCTAssertEqual(reportContent.groups, report.groups, "Groups split error")
            XCTAssertNotEqual(reportContent.groups, [], "Groups array is empty")
            XCTAssertEqual(reportContent.footerString, report.footerString, "Footer split error")
            XCTAssertNotEqual(reportContent.footerString, "", "Footer is empty")
        }
    }

    /// Make sure you not testing empty properties in testSplitReportContent by reversing sample data to compare to
    /// - Throws: error if can't find file or file contents is empty
    func testSplitReportContentReversed() throws {
        let sampleContents = ReportContent.sampleContents.reversed()

        for (filename, report) in zip(filenames, sampleContents) {
            let contents = try contentsOf(filename)
            let reportContent = contents.splitReportContent()

            XCTAssertNotEqual(reportContent.headerString, report.headerString, "Header split error")
            XCTAssertNotEqual(reportContent.groups, report.groups, "Groups split error")
            XCTAssertNotEqual(reportContent.footerString, report.footerString, "Footer split error")
        }
    }

    func testHeaderTokenization() throws {
        let allHeaderTokens = Tokens.HeaderToken.allHeaderTokens

        for (filename, header) in zip(filenames, allHeaderTokens) {
            let contents = try contentsOf(filename)
            let reportContent = contents.splitReportContent()

            #warning("cleanReport before tokenization but after splitReportContent")
            // .cleanReport()
            let tokenizedHeader = reportContent.headerString.tokenizeReportHeader()
            XCTAssertEqual(tokenizedHeader, header, "Header tokenization error")

        }
    }

    func testFooterTokenization() throws {
        let allFooterTokens = Tokens.FooterToken.allFooterTokens

        for (filename, footer) in zip(filenames, allFooterTokens) {
            let contents = try contentsOf(filename)
            let reportContent = contents.splitReportContent()

            #warning("cleanReport before tokenization but after splitReportContent")
            // .cleanReport()
            let tokenizedFooter = reportContent.footerString.tokenizeReportFooter()
            XCTAssertEqual(tokenizedFooter, footer, "Footer tokenization error")
        }
    }

    func testGroupTokenization() throws {
        #warning("Groups!! & Footer")
    }
}
