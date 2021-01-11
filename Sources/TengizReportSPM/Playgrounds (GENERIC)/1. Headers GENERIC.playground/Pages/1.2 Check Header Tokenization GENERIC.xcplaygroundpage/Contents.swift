import Foundation
import TengizReportSPM

// MARK: - Use Header Samples for testing

// 1. check tokenization using just samples
func checkTokenizationOfSamples() {
    Token<HeaderSymbol>.allHeaderTokens
        .flatMap { $0 }
        .forEach { sample in
            let token = Token<HeaderSymbol>(stringLiteral: sample.source)

            guard token != sample else {
                print("OK: tokenizing sample source match sample tokens\n")
                return
            }

            print("ERROR tokenizing sample source")
            print("WANT: \(sample.symbol.printStr)")
            print("HAVE: \(token.symbol.printStr)")
            print(String(repeating: "-", count: 82))
        }
}
checkTokenizationOfSamples()

// 2. compare tokenization of source files with samples
func compareTokenizationOfSourceFilesWithSamples() throws {
    let tokens = try filenames
        .flatMap { filename in
            try filename
                .contentsOf()
                .cleanReport()
                .splitReportContent()
                .header
                .tokenizeReportHeaderGENERIC()
        }

    let sampleTokens = Token<HeaderSymbol>.allHeaderTokens.flatMap { $0 }

    guard tokens != sampleTokens else {
        print("OK: tokenizing file headers match sample tokens\n")
        return
    }

    zip(tokens, sampleTokens)
        .forEach { token, sample in
            if token != sample {
                print("\(String(repeating: "-", count: 60)) ERROR in tokenization")
                //print("line: \(sample.line)")
                print("WANT: \(sample.symbol.printStr)")
                print("HAVE: \(token.symbol.printStr)")
                print(String(repeating: "-", count: 82))
            } else {
                print("other error")
            }
        }
}
try compareTokenizationOfSourceFilesWithSamples()
