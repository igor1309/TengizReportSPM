import XCTest
@testable import TengizReportSPM

final class TengizReportSPMTests: XCTestCase {
    func testTextFilesReadable() throws {
        try filenames
            .forEach {
                XCTAssertFalse(try $0.contentsOf().isEmpty, "Can't read Report file content")
            }
    }

    /// - Throws: error if can't find file or file contents is empty
    func testSplitReportContent() throws {
        let samples = ReportContent.sampleContents

        try zip(filenames, samples)
            .forEach { filename, sample in
                let contents = try filename.contentsOf()
                let reportContent = contents.reportContent()

                XCTAssertFalse(reportContent.hasError, "Errors in splitting report content")
                XCTAssertFalse(reportContent.header.isEmpty, "Header is empty")
                XCTAssertEqual(reportContent.header, sample.header, "Header split error")
                XCTAssertEqual(reportContent.body, sample.body, "Body split error")
                XCTAssertFalse(reportContent.body.isEmpty, "Body array is empty")
                XCTAssertEqual(reportContent.footer, sample.footer, "Footer split error")
                XCTAssertFalse(reportContent.footer.isEmpty, "Footer is empty")
            }

        /// Make sure you not testing empty properties in testSplitReportContent by reversing sample data to compare to
        let reversedSamples = ReportContent.sampleContents.reversed()

        try zip(filenames, reversedSamples)
            .forEach { filename, sample in
                let contents = try filename.contentsOf()
                let reportContent = contents.reportContent()

                XCTAssertNotEqual(reportContent.header, sample.header, "Header split error")
                XCTAssertNotEqual(reportContent.body, sample.body, "Body split error")
                XCTAssertNotEqual(reportContent.footer, sample.footer, "Footer split error")
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

final class HeaderTests: XCTestCase {
    func testHeaderSampleSources() throws {
        let headersInSamples = Token<HeaderSymbol>.allHeaderTokens.flatMap { $0 }.map(\.source)

        let headersInFiles = try filenames
            .flatMap { filename in
                try filename
                    .contentsOf()
                    .cleanReport()
                    .reportContent()
                    .header
                    .replaceMatches(for: #"\t"#, withString: String.delimiter)
                    .replaceMatches(for: #"\n"#, withString: String.delimiter)
                    .components(separatedBy: String.delimiter)
            }
            .filter { !$0.isEmpty }

        XCTAssertEqual(headersInSamples, headersInFiles, "ERROR: header in samples and file are different")

        zip(headersInSamples, headersInFiles)
            .forEach { sample, header in
                XCTAssertEqual(sample, header, "ERROR: header in samples and file are different")
            }
    }

    func testHeaderTokenizationOfSamples() {
        Token<HeaderSymbol>.allHeaderTokens.flatMap { $0 }
            .forEach { sample in
                let token = Token<HeaderSymbol>(stringLiteral: sample.source)
                XCTAssertEqual(token, sample, "Header tokenization error")
            }
    }

    func testHeaderTokenizationOfSourceFilesWithSamples() throws {
        let tokens = try filenames
            .flatMap { filename in
                try filename
                    .contentsOf()
                    .cleanReport()
                    .reportContent()
                    .header
                    .reportHeader()
            }

        let samples = Token<HeaderSymbol>.allHeaderTokens.flatMap { $0 }
        XCTAssertEqual(tokens, samples, "Header tokenization error")

        let reversedSampls = Array(Token<HeaderSymbol>.allHeaderTokens.flatMap { $0 }.reversed())
        XCTAssertNotEqual(tokens, reversedSampls, "Header tokenization error")

        zip(tokens, samples)
            .forEach { token, sample in
                XCTAssertEqual(token, sample, "Header tokenization error")
            }
    }

}

final class FooterTests: XCTestCase {
    func testFooterSampleSources() throws {
        let footersInSamples = Token<FooterSymbol>.allFooterTokens
            .map { token in
                token
                    .map(\.source)
                    .joined(separator: "\n")
                    .cleanReport()
            }

        let footersInFiles = try filenames
            .map { filename in
                try filename
                    .contentsOf()
                    .reportContent()
                    .footer
                    .cleanReport()
            }

        XCTAssertEqual(footersInSamples, footersInFiles, "ERROR: footer sources in samples do not match footers in files")

        zip(footersInSamples, footersInFiles)
            .forEach { sample, footer in
                XCTAssertEqual(sample, footer, "ERROR: footer sources in samples do not match footers in files")
            }
    }

    func testFooterTokenizationOfSamples() {
        Token<FooterSymbol>
            .allFooterTokens
            .flatMap { $0 }
            .forEach { sample in
                // tokenizeReportFooter() returns array
                // but here sample.source contains just one token
                let token = sample.source.reportFooter().first ?? Token<FooterSymbol>(source: sample.source, symbol: .error)

                XCTAssertEqual(token, sample, "ERROR in tokenization of samples")
            }
    }

    func testFooterTokenizationOfSourceFilesWithSamples() throws {
        let samples = Token<FooterSymbol>.allFooterTokens.flatMap { $0 }

        let tokens = try filenames
            .flatMap { filename in
                try filename
                    .contentsOf()
                    .reportContent()
                    .footer
                    .cleanReport()
                    .reportFooter()
            }

        XCTAssertEqual(tokens, samples, "ERROR in tokenization (files)")

        zip(samples, tokens)
            .forEach { sample, token in
                XCTAssertEqual(token, sample, "ERROR in tokenization (files)")
            }
    }

}

final class BodyTests: XCTestCase {
    func testBodySampleSources() throws {
        let filesSources = try filenames
            .flatMap { filename in
                try filename
                    .contentsOf()
                    .cleanReport()
                    .reportContent()
                    .body
                    .flatMap { group in
                        group
                            .reportBodyGroup()
                            .map(\.source)
                    }
            }

        let sampleSources = Token<BodySymbol>.allBodyTokens
            .flatMap {
                $0.map(\.source)
            }

        XCTAssertEqual(filesSources, sampleSources, "ERROR: body groups in samples and files are different")

        zip(filesSources, sampleSources)
            .forEach { body, sample in
                XCTAssertEqual(body, sample, "ERROR: body groups in samples and files are different")
            }
    }

    func testTokenizationOfSourceFilesWithSamples() throws {
        let tokens = try filenames
            .map { filename in
                try filename
                    .contentsOf()
                    .cleanReport()
                    .reportContent()
                    .body
                    .flatMap { group in
                        group.reportBodyGroup()
                    }
            }

        let samples = Token<BodySymbol>.allSignificantBodyTokens

        XCTAssertEqual(tokens, samples, "ERROR: body groups in samples and files are different")
        XCTAssertEqual(tokens.count, samples.count, "ERROR: count: tokens \(tokens.count) != samples \(samples.count)")

        zip(tokens, samples)//.dropFirst(30).prefix(7)
            .forEach { tokensGroup, samplesGroup in
                zip(tokensGroup, samplesGroup)
                    .forEach { token, sample in
                        XCTAssertEqual(token, sample, "ERROR: body groups in samples and files are different")
                    }
            }
    }
}
