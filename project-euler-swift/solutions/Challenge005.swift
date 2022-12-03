//
//  Challenge005.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 05/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=5

struct Challenge005: Challenge {
    
    // input data
    let divisorMin = 1
    let divisorMax = 20
    
    func solve() -> Int {
        // creating array of divisors
        let divisors = CArray(divisorMin..<divisorMax)
        
        // calculating the result using the least common multiple algorithm
        return divisors.reduce(divisorMax, leastCommonMultiple)
    }
    
    private func leastCommonMultiple(of number1: Int, _ number2: Int) -> Int {
        // find larger number
        let increaseFactor = max(number1, number2)
        // find lower number
        let checkFactor = min(number1, number2)
        
        // initialize result with the larger number value
        var result = increaseFactor
        
        // increase result by increase factor (larger number)
        // until getting the required result
        while !result.isMultiple(of: checkFactor) {
            result += increaseFactor
        }
        
        // return least common multiple
        return result
    }
}
