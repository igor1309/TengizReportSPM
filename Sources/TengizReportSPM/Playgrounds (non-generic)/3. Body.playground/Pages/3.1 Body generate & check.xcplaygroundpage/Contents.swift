import Foundation
import TengizReportSPM

// MARK: - Generate Body Samples
// run generateBodySamples(), use console output to set vars in public extension Tokens.BodyToken
func generateBodySamples() throws {
    let tokenizedBodyGroups = try filenames
        .map { filename in
            try filename
                .contentsOf()
                .cleanReport()
                .splitReportContent()
                .body
        }
        .map {
            $0.map { $0.tokenizeReportBodyGroup() }
        }

    //    tokenizedBodyGroups.forEach {
    //        $0.forEach {
    //            $0.forEach {
    //                print($0.symbol.printStr)
    //            }
    //        }
    //        print(String(repeating: "#", count: 120))
    //    }

    tokenizedBodyGroups.enumerated()
        .forEach {
            let offset = String(format: "%02d", $0.offset + 6)
            print("\nstatic var bodyTokens2020\(offset)a: [Tokens.BodyToken] {\n[", terminator: "")
            $0.element.forEach {
                $0.forEach {
                    // print("Tokens.\($0),")
                    //print("Tokens.BodyToken(source: \"\($0.source)\", symbol: .\($0.symbol)),")
                    print("Tokens.BodyToken(source: ", terminator: "")
                    debugPrint("\($0.source)", terminator: "")
                    print(", symbol: .\($0.symbol)),")
                }
            }
            print("]\n}")
        }
}
// MARK: uncomment next line to generate samples
// try generateBodySamples()

// MARK: - Check Body Sample Sources
func checkBodySampleSources() throws {
    let sampleSources = Tokens.BodyToken.allBodyTokens
        .flatMap {
            $0.map(\.source)
        }
    // sampleSources.forEach { print($0) }

    let filesSources = try filenames
        .flatMap { filename in
            try filename
                .contentsOf()
                .cleanReport()
                .splitReportContent()
                .body
                .flatMap { group in
                    group
                        .tokenizeReportBodyGroup()
                        .map(\.source)
                }
        }
    // filesSources.forEach { print($0) }

    guard sampleSources != filesSources else {
        print("OK: sampleSources == filesSources")
        return
    }

    print("ERROR: body groups in samples and files are different")

    zip(sampleSources, filesSources)
        .forEach { sample, body in
            if sample != body {
                print("ERROR: body groups in samples and files are different")
                debugPrint(sample)
                print("------")
                debugPrint(body)
                print(String(repeating: "-", count: 120))
            }
        }
}
try checkBodySampleSources()
