import Foundation
import TengizReportSPM

func printAllRubliKopeikiFromReportsSorted() throws {
    try filenames
        .flatMap {
            try $0
                .contentsOfFile()
                .cleanReport()
                .listMatches(for: Patterns.rubliKopeiki)
        }
        .map {
            NumberSample(source: $0, result: $0.rubliIKopeikiToDouble())
        }
        .sorted(by: { $0.result < $1.result })
        .forEach { print($0) }
}
// printAllRubliKopeikiFromReportsSorted()

NumberSample.rubliKopeikiSamples
    .map {
        let rubKop = $0.source.rubliIKopeikiToDouble()
        //print($0.source, rubKop, $0.result == rubKop)
        return $0.result == rubKop
    }
    .reduce(true, { $0 && $1 })
