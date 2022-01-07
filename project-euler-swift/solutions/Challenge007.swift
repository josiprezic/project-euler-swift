//
//  Challenge007.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 07/01/2022.
//

import Foundation

struct Challenge007: Challenge {
    let resultPrimeId = 10_001
    
    func solve() -> Int {
        var primesFound = [2]
        var currentPrimeCandidate = 3
        
        while primesFound.count < resultPrimeId {
            if isPrime(currentPrimeCandidate, primesFound: primesFound) {
                primesFound.append(currentPrimeCandidate)
            }
            currentPrimeCandidate += 2
        }
        
        return primesFound[resultPrimeId - 1]
    }
    
    private func isPrime(_ primeCandidate: Int, primesFound divisorCandidates: [Int]) -> Bool {
        for currentDivisor in divisorCandidates {
            guard primeCandidate >= currentDivisor * currentDivisor else { return true }
            guard primeCandidate.isMultiple(of: currentDivisor) else { continue }
            return false
        }
        return true
    }
}
