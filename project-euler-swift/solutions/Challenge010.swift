//
//  Challenge010.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 10/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=10

struct Challenge010: Challenge {
    
    // input data
    let primeMax = 2_000_000

    func solve() -> Int {
        // creating list used to store primes
        var primesFound = [2]
        // initializing variable used to store prime candidates
        var currentPrimeCandidate = 3

        // while current candidate is smalled than upper bound
        while primesFound.last ?? Int.max < primeMax {
            // append number to the primes list if it is a prime
            if isPrime(currentPrimeCandidate, primesFound: primesFound) {
                primesFound.append(currentPrimeCandidate)
            }
            // otherwise move to the next odd number
            currentPrimeCandidate += 2
        }

        // remove the last one since it's larger than upper bound
        primesFound.removeLast()
        
        // return sum of the primes
        return primesFound.reduce(0, +)
    }

    private func isPrime(_ primeCandidate: Int, primesFound divisorCandidates: [Int]) -> Bool {
        let primeCandidateRoot = Int(primeCandidate.root)
        for currentDivisor in divisorCandidates {
            guard primeCandidateRoot >= currentDivisor else { return true }
            guard primeCandidate.isMultiple(of: currentDivisor) else { continue }
            return false
        }
        return true
    }
}
