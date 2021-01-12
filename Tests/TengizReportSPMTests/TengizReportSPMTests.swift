//
//  TengizReportSPMTests.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 07.01.2021.
//

import XCTest
@testable import TengizReportSPM

final class TengizReportSPMTests: XCTestCase {
    func testTextFilesReadable() throws {
        try filenames
            .forEach {
                XCTAssertFalse(try $0.contentsOfFile().isEmpty, "Can't read Report file content")
            }
    }

    /// - Throws: error if can't find file or file contents is empty
    func testSplitReportContent() throws {
        let samples = ReportContent.sampleContents

        try zip(filenames, samples)
            .forEach { filename, sample in
                let contents = try filename.contentsOfFile()
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
                let contents = try filename.contentsOfFile()
                let reportContent = contents.reportContent()

                XCTAssertNotEqual(reportContent.header, sample.header, "Header split error")
                XCTAssertNotEqual(reportContent.body, sample.body, "Body split error")
                XCTAssertNotEqual(reportContent.footer, sample.footer, "Footer split error")
            }
    }

}
