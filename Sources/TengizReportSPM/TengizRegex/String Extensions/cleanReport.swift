//
//  cleanReport.swift
//  
//
//  Created by Igor Malyarov on 07.01.2021.
//

import Foundation

public extension String {

    func cleanReport() -> String {
        // make some cleaning & fixes
        self.clearWhitespacesAndNewlines()
            // fix one special line
            .replaceMatches(for: #"(?m)^ФОТ Бренд, логистика, бухгалтерия"#,
                            withString: "2. ФОТ Бренд, логистика, бухгалтерия")
            .replaceMatches(for: "Итого-",
                            withString: "Итого ")
            // remove optionality from rubli-kopeiki making rubliKopeikiPattern and kopeikiPatterm simpler
            .replaceMatches(for: #"(\d{1,3}(?:\.\d{3})*) *р *(?:(\d\d?) *к\.?)"#,
                            withString: #"$1р $2к"#)
            // rubli without kopeiki -> just number
            .replaceMatches(for: #"(\d{1,3}(?:\.\d{3})*) *р(?= [^\dк)])"#,
                            withString: #"$1"#)
            // fix no space after dot after line number
            .replaceMatches(for: #"(?m)(^\d+.)([А-Я])"#, withString: #"$1 $2"#)
    }

}
