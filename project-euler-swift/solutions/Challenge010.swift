//
//  Challenge010.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 10/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=10

struct Challenge010: Challenge {
    let primeMax = 2_000_000

    func solve() -> Int {
        var primesFound = [2]
        var currentPrimeCandidate = 3

        while primesFound.last ?? Int.max < primeMax {
            if isPrime(currentPrimeCandidate, primesFound: primesFound) {
                primesFound.append(currentPrimeCandidate)
            }
            currentPrimeCandidate += 2
        }

        primesFound.removeLast()
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
