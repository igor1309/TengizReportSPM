//
//  NumbersTest.swift
//  TengizReportSPM
//
//  Created by Igor Malyarov on 11.01.2021.
//

import XCTest
import TengizReportSPM

final class NumbersTest: XCTestCase {
    func testRubliKopeikiConversion() {
        NumberSample.rubliKopeikiSamples
            .forEach {
                XCTAssertEqual($0.result, $0.source.rubliIKopeikiToDouble(),
                               "rubliIKopeikiToDouble conversion error")
            }
    }
}

