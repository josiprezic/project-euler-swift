//
//  Challenge001.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 01/01/2022.
//

import Foundation

struct Challenge001: Challenge {
    let arrayMax = 1_000
    
    func solve() -> Int {
        (1..<arrayMax)
            .filter { $0.isMultiple(of: 3) || $0.isMultiple(of: 5) }
            .reduce(0, +)
    }
}
