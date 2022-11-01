//
//  Challenge009.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 09/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=9

struct Challenge009: Challenge {
    
    // input data
    let tripletSum = 1_000
    
    func solve() -> Int {
        let aRange = 1...(tripletSum / 3)
        let cMax = tripletSum / 2
        
        for aCandidate in aRange {
            let bMin = cMax - aCandidate
            let bMax = cMax - (aCandidate + 1) / 2
            for bCandidate in bMin...bMax {
                let cCandidate = tripletSum - aCandidate - bCandidate
                guard aCandidate.squared + bCandidate.squared == cCandidate.squared else { continue }
                return aCandidate * bCandidate * cCandidate
            }
        }
        print("Triplet not found.")
        return 0
    }
}
