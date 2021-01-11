import Foundation
import TengizReportSPM

// MARK: - Use Header Samples for testing

// 1. check tokenization using just samples
func checkTokenizationOfSamples() {
    Token<FooterSymbol>
        .allFooterTokens
        .flatMap { $0 }
        .forEach { sample in
            // tokenizeReportFooter() returns array
            // but here sample.source contains just one token
            let token = sample.source.reportFooter().first ?? Token<FooterSymbol>(source: sample.source, symbol: .error)

            if token != sample {
                print("\(String(repeating: "-", count: 60)) ERROR in tokenization of samples")
                if token.source != sample.source {
                    print("sample source:\n\"\([sample.source])\"")
                    print("token source:\n\"\([token.source])\"")
                    print("----")
                }
                print("WANT:")
                debugPrint(sample.symbol.printStr)
                print("------")
                print("HAVE:")
                debugPrint(token.symbol.printStr)
                print(String(repeating: "#", count: 120))
            }
        }
}
checkTokenizationOfSamples()

// 2. compare tokenization of source files with samples
func checkTokenizationOfSourceFilesWithSamples() throws {
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

    guard samples != tokens else {
        print("\nOK: samples == tokens\n")
        return
    }

    zip(samples, tokens)
        .forEach { sample, token in
            if token != sample {
                print("\(String(repeating: "-", count: 60)) ERROR in tokenization (files)")
                if token.source != sample.source {
                    print("sample source:")
                    debugPrint(sample.source)
                    print("token source:")
                    debugPrint(token.source)
                    print("----")
                }
                print("WANT:\n\(sample.symbol.printStr)")
                print("HAVE:\n\(token.symbol.printStr)")
                print(String(repeating: "#", count: 120))
            }
        }
}
try compareTokenizationOfSourceFilesWithSamples()
