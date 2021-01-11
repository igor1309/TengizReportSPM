import Foundation
import TengizReportSPM

// MARK: - Generate Header Samples
// run generateHeaderSamples(), use console output to set vars in public extension Tokens.HeaderToken
func generateHeaderSamples() throws {
    let headerTokens = try filenames
        .map { filename in
            try filename
                .contentsOf()
                .cleanReport()
                .splitReportContent()
                .header
                .tokenizeReportHeader()
        }

    headerTokens.enumerated()
        .forEach {
            let offset = String(format: "%02d", $0.offset + 6)
            print("\nstatic var headerTokens2020\(offset): [Tokens.HeaderToken] {\n[", terminator: "")
            $0.element.forEach {
                print("Tokens.HeaderToken(source: ", terminator: "")
                debugPrint("\($0.source)", terminator: "")
                print(", symbol: .\($0.symbol)),")
            }
            print("]\n}")
        }
}
// MARK: uncomment next line to generate samples
// try generateHeaderSamples()

// MARK: - Check Header Sample Sources
func checkHeaderSampleSources() throws {
    let headersInSamples = Tokens.HeaderToken.allHeaderTokens.flatMap { $0 }.map(\.source)

    let headersInFiles = try filenames
        .flatMap { filename in
            try filename
                .contentsOf()
                .cleanReport()
                .splitReportContent()
                .header
                .replaceMatches(for: #"\t"#, withString: String.delimiter)
                .replaceMatches(for: #"\n"#, withString: String.delimiter)
                .components(separatedBy: String.delimiter)
        }
        .filter { !$0.isEmpty }

    guard headersInSamples != headersInFiles else {
        print("OK: headers in samples match headers in files\n")
        return
    }

    zip(headersInSamples, headersInFiles)
        .forEach { sample, header in
            if sample != header {
                print("ERROR: header in samples and file are different")
                print("sample:")
                debugPrint(sample)
                print("in file:")
                debugPrint(header)
                print(String(repeating: "-", count: 120))
            }
        }
}
try checkHeaderSampleSources()
