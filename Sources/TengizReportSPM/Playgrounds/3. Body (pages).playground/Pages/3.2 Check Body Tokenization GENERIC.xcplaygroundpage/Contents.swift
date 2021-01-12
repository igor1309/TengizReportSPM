import Foundation
import TengizReportSPM

// 1. check tokenization using just samples
func checkTokenizationOfSamples() {
    Token<BodySymbol>.allBodyTokens
        .forEach { month in
            month.forEach { samples in
                let bodyGroup = samples.map(\.source).joined(separator: "\n")
                let tokens: [Token<BodySymbol>] = bodyGroup.reportBodyGroup()

                guard tokens != samples else {
                    //print("OK: tokenizing sample source match sample tokens")
                    return
                }

                zip(tokens, samples)
                    .forEach { token, sample in
                        if token.symbol != sample.symbol {
                            print("\(String(repeating: "-", count: 60)) ERROR in tokenization")
                            print("WANT: \(sample.symbol.printStr)")
                            print("HAVE: \(token.symbol.printStr)")
                        }
                    }
            }
        }
}
checkTokenizationOfSamples()

// 2. compare tokenization of source files with samples
func checkTokenizationOfSourceFilesWithSamples() throws {
    let tokens = try filenames
        .map { filename in
            try filename
                .contentsOfFile()
                .cleanReport()
                .reportContent()
                .body
                .map { group in
                    group.reportBodyGroup()
                }
        }

    // print(type(of: tokens))
    // tokens.forEach { $0.forEach { print($0.symbol.printStr) } }

    let samples = Token<BodySymbol>.allSignificantBodyTokens
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

    zip(tokens.flatMap { $0 }, samples.flatMap { $0 })//.dropFirst(30).prefix(7)
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
try checkTokenizationOfSourceFilesWithSamples()
