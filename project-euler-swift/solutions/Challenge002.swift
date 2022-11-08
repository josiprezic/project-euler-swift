//
//  Challenge002.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 02/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=2

struct Challenge002: Challenge {
    
    // upper limit for Fibonacci sequence values
    let valueLimit = 4_000_000
    
    func solve() -> Int {
        // used to create value history
        var previous1 = 1
        var previous2 = 2
        
        // initializing the final sum value
        var sum = 0
        
        // looping until the value limit is reached
        while previous2 < valueLimit {
            // adding value to the final sum
            sum += previous2
            
            // since only every third value in Fibonacci sequence is
            // even and since we want to summarize the even values only,
            // we can just "jump" to every third value and summarize them
            // to get the final result
            for _ in 1...3 {
                // moving to the next Fibonacci sequence values
                previous2 += previous1
                previous1 = previous2 - previous1
            }
        }
        return sum
    }
}
