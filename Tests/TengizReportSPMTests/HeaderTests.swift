//
//  HeaderTests.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 11.01.2021.
//

import XCTest
import TengizReportSPM

final class HeaderTests: XCTestCase {
    func testHeaderSampleSources() throws {
        let headersInSamples = Token<HeaderSymbol>.allHeaderTokens.flatMap { $0 }.map(\.source)

        let headersInFiles = try filenames
            .flatMap { filename in
                try filename
                    .contentsOfFile()
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
                    .contentsOfFile()
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

