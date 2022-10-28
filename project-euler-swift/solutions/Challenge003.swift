//
//  Challenge003.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 03/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=3

struct Challenge003: Challenge {
    let input = 600_851_475_143
    
    func solve() -> Int {
        var inputCopy = input
        var quotient = 2
        
        while quotient <= inputCopy {
            if inputCopy.isMultiple(of: quotient) {
                inputCopy /= quotient
            } else {
                quotient += 1
            }
        }
        return quotient
    }
}
