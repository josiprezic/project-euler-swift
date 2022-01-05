//
//  Challenge005.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 05/01/2022.
//

import Foundation

struct Challenge005: Challenge {
    let divisorMin = 1
    let divisorMax = 20
    
    func solve() -> Int {
        var currentResult = divisorMax
        for divisor in divisorMin..<divisorMax {
            currentResult = leastCommonMultiple(of: divisor, currentResult)
        }
        return currentResult
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
