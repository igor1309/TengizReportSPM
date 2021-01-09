import XCTest
@testable import TengizReportSPM

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
            XCTAssertNotEqual(reportContent.header, "", "Header is empty")
            XCTAssertEqual(reportContent.header, report.header, "Header split error")
            XCTAssertEqual(reportContent.body, report.body, "Body split error")
            XCTAssertNotEqual(reportContent.body, [], "Body array is empty")
            XCTAssertEqual(reportContent.footer, report.footer, "Footer split error")
            XCTAssertNotEqual(reportContent.footer, "", "Footer is empty")
        }
    }

    /// Make sure you not testing empty properties in testSplitReportContent by reversing sample data to compare to
    /// - Throws: error if can't find file or file contents is empty
    func testSplitReportContentReversed() throws {
        let sampleContents = ReportContent.sampleContents.reversed()

        for (filename, report) in zip(filenames, sampleContents) {
            let contents = try filename.contentsOf()
            let reportContent = contents.splitReportContent()

            XCTAssertNotEqual(reportContent.header, report.header, "Header split error")
            XCTAssertNotEqual(reportContent.body, report.body, "Body split error")
            XCTAssertNotEqual(reportContent.footer, report.footer, "Footer split error")
        }
    }

    func testHeaderTokenizationOfSamples() {
        let tokens = Tokens.HeaderToken.allHeaderTokens
            .compactMap { sample -> [Tokens.HeaderToken]? in
                switch sample {
                    case let .company(source: source, name: _):
                        return source.tokenizeReportHeader()

                    case .month(source: _, monthStr: _),
                         .item(source: _, title: _, value: _),
                         .error(source: _):
                        return nil
                }
            }
            .flatMap { $0 }

        let sampleTokens = Tokens.HeaderToken.allHeaderTokens

        zip(tokens, sampleTokens)
            .forEach { token, sample in
                XCTAssertEqual(token, sample, "Header tokenization error")
            }
    }

    func testHeaderTokenization() throws {
        let tokens = try filenames
            .flatMap { filename in
                try filename
                    .contentsOf()
                    .cleanReport()
                    .splitReportContent()
                    .header
                    .tokenizeReportHeader()
            }

        let sampleTokens = Tokens.HeaderToken.allHeaderTokens

        zip(tokens, sampleTokens)
            .forEach { token, sample in
                XCTAssertEqual(token, sample, "Header tokenization error")
            }
    }

    func testTransformLineToBodyItem() {
        LineBodyToken.allSignificantLineBodyTokens
            .forEach { sample in
                let token = sample.line.cleanReport().transformLineToBodyItem() ?? .empty

                XCTAssertEqual(token, sample.token, "ERROR Transforming Line to BodyItem")
            }
    }

    func testBodyTokenization() throws {
        let bodyTokens = try filenames
            .flatMap { filename in
                try filename
                    .contentsOf()
                    .splitReportContent()
                    .body
            }
            .compactMap {
                $0
                    .cleanReport()
                    .transformLineToBodyItem()
            }

        let sampleTokens = Tokens.BodyToken.allSignificantBodyTokens

        zip(bodyTokens, sampleTokens)
            .forEach { token, sample in
                XCTAssertEqual(token, sample, "Error body item tokenization")
            }
    }

    func testFooterTokenization() throws {
        let footerTokens = try filenames
            .flatMap { filename in
                try filename
                    .contentsOf()
                    .cleanReport()
                    .splitReportContent()
                    .footer
                    .tokenizeReportFooter()
            }

        let sampleTokens = Tokens.FooterToken.allFooterTokens

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
