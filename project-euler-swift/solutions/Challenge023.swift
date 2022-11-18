//
//  Challenge023.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 18/11/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=23

struct Challenge023: Challenge {
    
    // input data
    let abundantMin = 12
    let candidateMin = 24
    let candidateMax = 28_123
    
    func solve() -> Int {
        // creating array of abundant numbers.
        let abundantNumbers = Array(abundantMin...candidateMax)
            .filter(isAbundant)
        
        // calculating abundant sums from all possible combinations
        let abundantNumberSums = abundantNumbers
            // fancy way to create 2-dimensional array
            .map{ firstAddend in abundantNumbers.map { secondAddend in firstAddend + secondAddend } }
            // converting it back to 1-dimensional array
            .flatMap { $0 }
            // removing all items greater than the upper bound
            .filter { $0 <= candidateMax }
        
        // removing all sum duplicates
        let abundantNumberUniqueSums = Set(abundantNumberSums)
        
        return (1...candidateMax)
            // removing all numbers which can be written as the sum of two abundant numbers
            .filter { !abundantNumberUniqueSums.contains($0) }
            // calculating their sum
            .reduce(0, +)
    }
    
    // number n is called abundant if the sum of its proper divisors exceeds n
    private func isAbundant(_ value: Int) -> Bool {
        // calculating the greatest possible divisor for a given number
        let maxDivisorCandidate = value.isMultiple(of: 2) ? (value / 2) : (value / 3)
        // creating a list of possible divisors based on the maxDivisorCandidateValue
        let divisorCandidates = CArray((1...maxDivisorCandidate).reversed())
        
        // creating sum variable
        var sumOfDivisors = 0
        
        
        for divisorCandidate in divisorCandidates {
            // checking if divisor candidate is actually a divisor
            guard value.isMultiple(of: divisorCandidate) else { continue }
            // if so, adding a divisor to the sum of divisors
            sumOfDivisors += divisorCandidate
            
            // if divisor sum exceeds the number value, then we know that it is an abundant value
            if sumOfDivisors > value {
                return true
            }
        }
        return false
    }
}
