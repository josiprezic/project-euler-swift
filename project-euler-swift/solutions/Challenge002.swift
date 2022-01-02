//
//  Challenge002.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 02/01/2022.
//

import Foundation

struct Challenge002: Challenge {
    let valueLimit = 4_000_000
    
    func solve() -> Int {
        var previous1 = 1
        var previous2 = 2
        var sum = 0
        
        while previous2 < valueLimit {
            sum += previous2
            
            for _ in 1...3 {
                previous2 += previous1
                previous1 = previous2 - previous1
            }
        }
        return sum
    }
}
