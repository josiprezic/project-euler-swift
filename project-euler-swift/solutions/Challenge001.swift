//
//  Challenge001.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 01/01/2022.
//

import Foundation

// Challenge description: https://projecteuler.net/problem=1

struct Challenge001: Challenge {
    
    // number of candidates
    let arrayMax = 1_000
    
    func solve() -> Int {
        // creating a range of the candidate numbers
        (1..<arrayMax)
        
            // filtering all the multiplies of 3 and 5
            .filter { $0.isMultiple(of: 3) || $0.isMultiple(of: 5) }
        
            // reducing them to get the result sum
            .reduce(0, +)
    }
}
