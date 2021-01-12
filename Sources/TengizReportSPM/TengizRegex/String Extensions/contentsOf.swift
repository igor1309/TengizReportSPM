//
//  contentsOf.swift
//  
//
//  Created by Igor Malyarov on 08.01.2021.
//

import Foundation

public enum TestErrors: Error {
    case noFile(String)
}

public extension String {
    func contentsOfFile() throws -> String {
        guard let filepath = Bundle.module.path(forResource: self, ofType: "txt") else { throw TestErrors.noFile(self) }
        return try String(contentsOfFile: filepath)
    }

}
