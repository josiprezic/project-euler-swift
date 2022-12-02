//
//  Challenge007.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 07/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=7

struct Challenge007: Challenge {
    
    // input data
    let resultPrimeId = 10_001
    
    func solve() -> Int {
        // initializing the list of prime numbers
        var primesFound = [2]
        
        // initializing prime candidate
        var currentPrimeCandidate = 3
        
        // repeat until finding the prime on the required possition
        while primesFound.count < resultPrimeId {
            // add number to the primes list if is prime
            if isPrime(currentPrimeCandidate, primesFound: primesFound) {
                primesFound.append(currentPrimeCandidate)
            }
            
            // adding two to get odd numbers since all even numbers
            // greater than two are not prime numbers
            currentPrimeCandidate += 2
        }
        
        return primesFound[resultPrimeId - 1]
    }
    
    // returns true if the provided number is prime. Additional parameter divisorCandidates is
    // used in optimization purposes
    private func isPrime(_ primeCandidate: Int, primesFound divisorCandidates: [Int]) -> Bool {
        for currentDivisor in divisorCandidates {
            guard primeCandidate >= currentDivisor * currentDivisor else { return true }
            guard primeCandidate.isMultiple(of: currentDivisor) else { continue }
            return false
        }
        return true
    }
}
