//
//  Challenge027.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 03/10/2025.
//

import Foundation

// Challenge description: https://projecteuler.net/problem=27

struct Challenge027: Challenge {
    
    // Input data
    let aCandidates = -999...999
    let bCandidates = -1_000...1_000
    
    func solve() -> Int {
        // Used to store a maximum length of the quadratic array found
        var maxLength: Int = 0
        
        // Used to store a temporary A coefficient used for the current maxLength calculation
        var resultA: Int = 0
        
        // Used to store a temporary B coefficient used for the current maxLength calculation
        var resultB: Int = 0
        
        // Go through A coefficient candidates
        for a in aCandidates {
            
            // Go through B coefficient candidates
            for b in bCandidates {
                
                // Get quatratic length and update temporary variables if needed
                let currentLength = getQuadraticLength(for: a, b: b)
                if currentLength > maxLength {
                    resultA = a
                    resultB = b
                    maxLength = currentLength
                }
            }
        }
        
        // Calculate and return the final product of the coefficients
        return resultA * resultB
    }
    
    /// Computes the length of the longest consecutive sequence of non-negative integers n (starting at 0)
    /// for which the quadratic expression n² + a·n + b yields a prime number.
    /// The sequence ends at the first n where the expression is not prime.
    /// - Parameters:
    ///   - a: The linear coefficient in the quadratic expression.
    ///   - b: The constant term in the quadratic expression.
    /// - Returns: The number of consecutive n values (beginning at n = 0) that produce a prime result.
    func getQuadraticLength(for a: Int, b: Int) -> Int {
        var n = 0
        
        var shouldContinue = true
        
        while shouldContinue {
            let result = n * n + a * n + b
            guard isPrime(result) else {
                shouldContinue = false
                return n
            }
            n += 1
        }
    }
    
    /// Used for the prime number checks
    /// - Parameter primeCandidate: Number to be checked
    /// - Returns: `true` if the provided number is prime
    private func isPrime(_ primeCandidate: Int) -> Bool {
        // Check for excluded values
        let excludedValues = [1, 2, 0, -1, -2]
        if excludedValues.contains(primeCandidate) { return true }
        
        // Create list of divisor candidates
        let divisorCandidateMax = abs(primeCandidate - 1)
        let divisorCandidates = 2...divisorCandidateMax
        
        // Check for multiplicity
        for divisorCandidate in divisorCandidates {
            if primeCandidate.isMultiple(of: divisorCandidate) {
                return false
            }
        }
        
        return true
    }
}
