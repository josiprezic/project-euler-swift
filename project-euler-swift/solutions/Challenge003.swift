//
//  Challenge003.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 03/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=3

struct Challenge003: Challenge {
   
    // input data
    let input = 600_851_475_143
    
    func solve() -> Int {
        var inputCopy = input
        
        // initializing quotient variable and assigning the lowest divider value to it
        var quotient = 2
        
        while quotient <= inputCopy {
            // dividing input with quotient value if possible
            if inputCopy.isMultiple(of: quotient) {
                inputCopy /= quotient
            } else {
                // and if not, incrementing the quotient and trying again
                quotient += 1
            }
        }
        // at the end we have a number non-divisable by any number
        // apart from values 1 and it's own value, meaning that it's a prime number
        return quotient
    }
}
