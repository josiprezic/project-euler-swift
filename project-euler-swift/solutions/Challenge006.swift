//
//  Challenge006.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 06/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=6

struct Challenge006: Challenge {
    
    // input data
    let arrayMax = 100
    
    func solve() -> Int {
        // creating numbers array
        let numbers = Array(1...arrayMax)
        
        // calculating sum of squares
        let sumOfSquares = numbers.reduce(0) { $0 + $1 * $1 }
        
        // calculating square of a sum
        let sum = numbers.reduce(0, +)
        let squareOfSum = sum * sum
        
        return squareOfSum - sumOfSquares
    }
}
