import XCTest
@testable import TengizReportSPM

enum TestErrors: Error {
    case noFile(String)
}

extension String {
    func contentsOf() throws -> String {
        guard let filepath = Bundle.module.path(forResource: self, ofType: "txt") else { throw TestErrors.noFile(self) }
        return try String(contentsOfFile: filepath)
    }

}

final class TengizReportSPMTests: XCTestCase {

    func testTengizReportSPMReportTextFilessReadable() throws {
        try filenames
            .forEach {
                XCTAssertNotEqual(try $0.contentsOf(), "", "Can't read Report file content")
            }
    }

    func testSplitReportContent() throws {
        let sampleContents = ReportContent.sampleContents

        for (filename, report) in zip(filenames, sampleContents) {
            let contents = try filename.contentsOf()
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
            let contents = try filename.contentsOf()
            let reportContent = contents.splitReportContent()

            XCTAssertNotEqual(reportContent.headerString, report.headerString, "Header split error")
            XCTAssertNotEqual(reportContent.groups, report.groups, "Groups split error")
            XCTAssertNotEqual(reportContent.footerString, report.footerString, "Footer split error")
        }
    }

    func testHeaderTokenization() throws {
        let headerTokens = try filenames
            .flatMap {
                try $0.contentsOf()
                    .splitReportContent()
                    .headerString
                    .tokenizeReportHeader()
            }

        let sampleTokens = Tokens.HeaderToken.allHeaderTokens.flatMap { $0 }

        zip(headerTokens, sampleTokens)
            .forEach { token, sample in
                XCTAssertEqual(token, sample, "Header tokenization error")
            }
    }

    func testGroupTokenization() throws {
        #warning("Groups!! & Footer")
    }

    func testFooterTokenization() throws {
        let footerTokens = try filenames
            .flatMap {
                try $0
                    .contentsOf()
                    .splitReportContent()
                    .footerString
                    .tokenizeReportFooter()
            }

        let sampleTokens = Tokens.FooterToken.allFooterTokens.flatMap { $0 }

        zip(footerTokens, sampleTokens)
            .forEach { token, sample in
                XCTAssertEqual(token, sample, "Footer tokenization error")
            }
    }

    func testRubliKopeikiConversion() {
        NumberSample.rubliKopeikiSamples
            .forEach {
                XCTAssertEqual($0.result, $0.source.rubliIKopeikiToDouble(),
                               "rubliIKopeikiToDouble conversion error")
            }
    }
}
