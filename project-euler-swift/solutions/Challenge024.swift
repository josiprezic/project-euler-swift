//
//  Challenge024.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 19/11/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=24

struct Challenge024: Challenge {
    
    // input data
    let digits = 0...9
    let resultId = 1_000_000
    
    func solve() -> Int {
        // copying digits array for the manipulation purposes
        var digitsCopy = Array(digits)
        
        // used as the starting point from which we should check the lexicographic order
        var distanceFromResultIndex = self.resultId
        
        // buffer for storing result digits
        var resultPermutation = ""
        
        // repeating until all the digits are used
        while !digitsCopy.isEmpty {
            
            // in lexicographic order, every digit has it's own section, where the given digit appears at the first index
            // since these sections has equal sizes for all digits, we'll use it to optimize the calculation time
            let sectionSize = digitSectionSize(for: digitsCopy.count)
            
            // calculating next permutation result digit index
            let nextDigitIndex = Int((Float(distanceFromResultIndex) / Float(sectionSize)).rounded(.up)) - 1
            
            // getting the next permutation digit value
            let nextDigit = digitsCopy.remove(at: nextDigitIndex)
            
            // calculating indexes that do not need to check since they are belong to the non-result sections
            let indexesToSkip = nextDigitIndex * sectionSize
            
            // updating the distance from the result lexicographic order index
            distanceFromResultIndex -= indexesToSkip
            
            // appending newly calculated permutation digit to the final permutation result
            resultPermutation += String(nextDigit)
        }
        
        // converting and returning the lexicografic permutation value at the given index
        return Int(resultPermutation) ?? 0
    }
    
    // returns lexicographic order section size based on the provided digits count
    private func digitSectionSize(for digitsCount: Int) -> Int {
        precondition(digitsCount > 0, "Number nust have at least one digit.")
        // calculating factorial for the provided value to get total numer of combinations
        let combinationsCount = (1...digitsCount).reduce(1, *)
        
        // diving total by digits count to get the size of single section
        return combinationsCount / digitsCount
    }
}
