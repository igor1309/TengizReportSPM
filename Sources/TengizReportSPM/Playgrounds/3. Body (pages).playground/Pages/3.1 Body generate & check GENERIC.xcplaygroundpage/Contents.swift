import Foundation
import TengizReportSPM

// MARK: - Generate Body Samples
// run generateBodySamples(), use console output to set vars in public extension Tokens.BodyToken
func generateBodySamples() throws {
    let tokenizedBodyGroups = try filenames
        .map { filename in
            try filename
                .contentsOfFile()
                .cleanReport()
                .reportContent()
                .body
        }
        .map {
            $0.map { $0.reportBodyGroup() }
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
            print("\nstatic var bodyTokens2020\(offset): [[Token<BodySymbol>]] {\n[", terminator: "")
            $0.element.forEach {
                print("[", terminator: "")
                $0.forEach {
                    // print("Tokens.\($0),")
                    //print("Token<BodySymbol>(source: \"\($0.source)\", symbol: .\($0.symbol)),")
                    print("Token<BodySymbol>(source: ", terminator: "")
                    debugPrint("\($0.source)", terminator: "")
                    print(", symbol: .\($0.symbol)),")
                }
                print("],")
            }
            print("]\n}")
        }
}
// MARK: uncomment next line to generate samples
// try generateBodySamples()

// MARK: - Check Body Sample Sources
func checkBodySampleSources() throws {
    let filesSources = try filenames
        .flatMap { filename in
            try filename
                .contentsOfFile()
                .cleanReport()
                .reportContent()
                .body
                .flatMap { group in
                    group
                        .reportBodyGroup()
                        .map(\.source)
                }
        }
    // filesSources.forEach { print($0) }

    let sampleSources = Token<BodySymbol>.allBodyTokens
        .flatMap {
            $0.flatMap{
                $0.map(\.source)
            }
        }
    // sampleSources.forEach { print($0) }

    guard filesSources != sampleSources else {
        print("OK: sampleSources == filesSources")
        return
    }

    print("ERROR: body groups in samples and files are different")

    zip(filesSources, sampleSources)
        .forEach { body, sample in
            if body != sample {
                print("ERROR: body groups in samples and files are different")
                debugPrint(sample)
                print("------")
                debugPrint(body)
                print(String(repeating: "-", count: 120))
            }
        }
}
try checkBodySampleSources()
