//
//  Challenge012.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 13/01/2022.
//

import Foundation

// TODO: Use prime factoriasation instead of brute force

struct Challenge012: Challenge {
    let minDivisorsCount = 500
    
    func solve() -> Int {
        var triangleCandidate = 1
        var increaseFactor = 2
        
        while triangleCandidate < minDivisorsCount {
            triangleCandidate += increaseFactor
            increaseFactor += 1
        }
        
        while numberOfDivisors(for: triangleCandidate) < minDivisorsCount {
            triangleCandidate += increaseFactor
            increaseFactor += 1
        }
        return triangleCandidate
    }
    
    func numberOfDivisors(for number: Int) -> Int {
        var divisorsCount = 0
        let root = Int(number.root)
        for divisorCandidate in 1..<root {
            guard number.isMultiple(of: divisorCandidate) else { continue }
            divisorsCount += 2
        }
        if root * root == number {
            divisorsCount -= 1
        }
        return divisorsCount
    }
}
