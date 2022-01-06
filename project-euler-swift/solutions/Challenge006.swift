//
//  Challenge006.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 06/01/2022.
//

import Foundation

struct Challenge006: Challenge {
    func solve() -> Int {
        let arrayMax = 100
        let numbers = Array(1...arrayMax)
        
        let sumOfSquares = numbers.reduce(0) { $0 + $1 * $1 }
        let sum = numbers.reduce(0, +)
        let squareOfSum = sum * sum
        
        return squareOfSum - sumOfSquares
    }
}
