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
        case emptyContent
    }

    func testTengizReportSPMReportsReadable() throws {
        for filename in filenames {
            guard let filepath = Bundle.module.path(forResource: filename, ofType: "txt") else { throw TestErrors.noFile(filename) }
            guard let contents = try? String(contentsOfFile: filepath) else { throw TestErrors.emptyContent}

            XCTAssertNotEqual(contents, "", "Report file content is empty")
        }
    }
}
