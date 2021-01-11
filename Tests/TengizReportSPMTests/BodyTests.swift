//
//  BodyTests.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 11.01.2021.
//

import XCTest
import TengizReportSPM

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
