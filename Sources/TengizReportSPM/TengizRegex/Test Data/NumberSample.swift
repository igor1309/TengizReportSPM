//
//  File.swift
//  
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public struct NumberSample {
    public let source: String
    public let result: Double

    public init(source: String, result: Double) {
        self.source = source
        self.result = result
    }
}

public extension NumberSample {
    static var rubliKopeikiSamples: [NumberSample] {
        [
            NumberSample(source: "5.863р 74к",     result: 5863.74),
            NumberSample(source: "13.318р 93к",    result: 13318.93),
            NumberSample(source: "21.346р 15к",    result: 21346.15),
            NumberSample(source: "21.806р 20к",    result: 21806.2),
            NumberSample(source: "23.334р 76к",    result: 23334.76),
            NumberSample(source: "31.949р 38к",    result: 31949.38),
            NumberSample(source: "37.146р 15к",    result: 37146.15),
            NumberSample(source: "75.255р 20к",    result: 75255.2),
            NumberSample(source: "80.220р 30к",    result: 80220.3),
            NumberSample(source: "87.091р 20к",    result: 87091.2),
            NumberSample(source: "92.531р 15к",    result: 92531.15),
            NumberSample(source: "96.628р 63к",    result: 96628.63),
            NumberSample(source: "98.340р 24к",    result: 98340.24),
            NumberSample(source: "145.292р 59к",   result: 145292.59),
            NumberSample(source: "157.455р 85к",   result: 157455.85),
            NumberSample(source: "277.306р 74к",   result: 277306.74),
            NumberSample(source: "313.570р 26к",   result: 313570.26),
            NumberSample(source: "355.483р 36к",   result: 355483.36),
            NumberSample(source: "357.254р 17к",   result: 357254.17),
            NumberSample(source: "393.081р 12к",   result: 393081.12),
            NumberSample(source: "407.477р 46к",   result: 407477.46),
            NumberSample(source: "407.477р 46к",   result: 407477.46),
            NumberSample(source: "437.474р 47к",   result: 437474.47),
            NumberSample(source: "437.474р 47к",   result: 437474.47),
            NumberSample(source: "444.719р 16к",   result: 444719.16),
            NumberSample(source: "451.198р 41к",   result: 451198.41),
            NumberSample(source: "475.228р 52к",   result: 475228.52),
            NumberSample(source: "498.373р 46к",   result: 498373.46),
            NumberSample(source: "521.519р 36к",   result: 521519.36),
            NumberSample(source: "529.875р 50к",   result: 529875.5),
            NumberSample(source: "538.773р 46к",   result: 538773.46),
            NumberSample(source: "545.119р 36к",   result: 545119.36),
            NumberSample(source: "609.230р 46к",   result: 609230.46),
            NumberSample(source: "628.215р 74к",   result: 628215.74),
            NumberSample(source: "628.215р 74к",   result: 628215.74),
            NumberSample(source: "632.684р 37к",   result: 632684.37),
            NumberSample(source: "642.997р 43к",   result: 642997.43),
            NumberSample(source: "642.997р 43к",   result: 642997.43),
            NumberSample(source: "645.184р 37к",   result: 645184.37),
            NumberSample(source: "739.626р 06к",   result: 739626.06),
            NumberSample(source: "739.626р 06к",   result: 739626.06),
            NumberSample(source: "753.950р 74к",   result: 753950.74),
            NumberSample(source: "907.841р",       result: 907841.0),
            NumberSample(source: "920.304р 17к",   result: 920304.17),
            NumberSample(source: "920.304р 17к",   result: 920304.17),
            NumberSample(source: "922.936р 37к",   result: 922936.37),
            NumberSample(source: "946.056р",       result: 946056.0),
            NumberSample(source: "1.065.596р 76к", result: 1065596.76),
            NumberSample(source: "1.677.077р 46к", result: 1677077.46),
            NumberSample(source: "2.030.572р 59к", result: 2030572.59),
            NumberSample(source: "2.094.271р 36к", result: 2094271.36),
            NumberSample(source: "2.343.392р 37к", result: 2343392.37),
            NumberSample(source: "2.865.042р 74к", result: 2865042.74)

        ]
    }
}

