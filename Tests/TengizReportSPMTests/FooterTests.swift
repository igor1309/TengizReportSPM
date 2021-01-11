//
//  FooterTests.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 11.01.2021.
//

import XCTest
import TengizReportSPM

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

