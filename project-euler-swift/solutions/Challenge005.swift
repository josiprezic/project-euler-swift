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
        let divisors = Array(divisorMin..<divisorMax)
        return divisors.reduce(divisorMax, leastCommonMultiple)
    }
    
    private func leastCommonMultiple(of number1: Int, _ number2: Int) -> Int {
        let increaseFactor = max(number1, number2)
        let checkFactor = min(number1, number2)
        var result = increaseFactor
        while !result.isMultiple(of: checkFactor) {
            result += increaseFactor
        }
        return result
    }
}
