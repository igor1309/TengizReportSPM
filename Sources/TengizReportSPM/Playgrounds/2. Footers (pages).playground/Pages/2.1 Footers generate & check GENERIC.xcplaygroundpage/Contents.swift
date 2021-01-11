import Foundation
import TengizReportSPM

// MARK: - Generate Footer Samples
// run generateFooterSamples(), use console output to set vars in public extension Tokens.FooterToken
// MARK: ##########################################################################
// MARK: - THIS DOES NOT WORK YET - tokenizeReportFooter() DOES NOT COVER ALL CASES
// MARK:   NEED TO CREATE SAMPLES MANUALLY
// MARK: ##########################################################################
#warning("finish with tokenizeReportFooter()")
func generateFooterSamples() throws {
    let footerTokens = try filenames
        .map { filename in
            try filename
                .contentsOf()
                .cleanReport()
                .reportContent()
                .footer
                .reportFooter()
        }
    
    footerTokens.enumerated()
        .forEach {
            let offset = String(format: "%02d", $0.offset + 6)
            print("\nstatic var footerTokens2020\(offset): [Token<FooterSymbol>] {\n[", terminator: "")
            $0.element.forEach {
                //                print("Tokens.\($0),")
                
                print("Token<FooterSymbol>(source: ", terminator: "")
                debugPrint("\($0.source)", terminator: "")
                print(", symbol: .\($0.symbol)),")
            }
            print("]\n}")
        }
}
// MARK: uncomment next line to generate samples
// try generateFooterSamples()

// MARK: - Check Footer Sample Sources
func checkFooterSampleSources() throws {
    let footersInSamples = Token<FooterSymbol>.allFooterTokens
        .map { token in
            token
                .map(\.source)
                .joined(separator: "\n")
                .cleanReport()
        }
    
    // footersInSamples.forEach { print($0) }
    
    let footersInFiles = try filenames
        .map { filename in
            try filename
                .contentsOf()
                .reportContent()
                .footer
                .cleanReport()
        }
    
    print("\n", String(repeating: "#", count: 120))
    
    if footersInSamples == footersInFiles {
        print("OK: footer sources in samples match footers in files\n")
    } else {
        zip(footersInSamples, footersInFiles)
            .forEach { sample, footer in
                if sample != footer {
                    print("ERROR: footer sources in samples and file are different")
                    print("sample:")
                    debugPrint(sample)
                    print("------")
                    print("in file:")
                    debugPrint(footer)
                    print(String(repeating: "-", count: 120))
                }
            }
    }
}
try checkFooterSampleSources()
