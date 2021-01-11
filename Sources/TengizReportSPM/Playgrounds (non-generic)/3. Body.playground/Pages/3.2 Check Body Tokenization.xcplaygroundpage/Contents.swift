import Foundation
import TengizReportSPM

// 1. check tokenization using just samples
// non-linear structure of Report Body (header, groups, footer)
// prevents from using the same checking technique as in Header/Footer
// for now use #2
func checkTokenizationOfSamples() {}
// checkTokenizationOfSamples()

// 2. compare tokenization of source files with samples
func compareTokenizationOfSourceFilesWithSamples() throws {
    let tokens = try filenames
        .map { filename in
            try filename
                .contentsOf()
                .cleanReport()
                .splitReportContent()
                .body
                .flatMap {
                    $0.tokenizeReportBodyGroup()
                }
        }

    // print(type(of: tokens))
    // tokens.forEach { $0.forEach { print($0.symbol.printStr) } }

    let samples = Tokens.BodyToken.allSignificantBodyTokens
    // samples.forEach { $0.forEach { print($0.symbol.printStr) } }

    tokens == samples
    tokens.count
    samples.count
    tokens.count == samples.count

    guard tokens != samples else {
        print("OK: tokens == samples")
        return
    }

    print("ERROR: tokens != samples\n")
    if tokens.count != samples.count {
        print("ERROR: count: tokens \(tokens.count) != samples \(samples.count)")
    }

    zip(tokens, samples)//.dropFirst(30).prefix(7)
        .forEach { tokensGroup, samplesGroup in
            zip(tokensGroup, samplesGroup)
                .forEach { token, sample in
                    if token != sample {
                        if token.source != sample.source {
                            print("sample.source:")
                            debugPrint(sample.source)
                            print("token.source:")
                            debugPrint(token.source)
                        }
                        if token.symbol != sample.symbol {
                            print("\(String(repeating: "-", count: 60)) ERROR in tokenization")
                            print("WANT: \(sample.symbol.printStr)")
                            print("HAVE: \(token.symbol.printStr)")
                        }
                        print(String(repeating: "-", count: 82))
                    }
                }
        }
}
try compareTokenizationOfSourceFilesWithSamples()
