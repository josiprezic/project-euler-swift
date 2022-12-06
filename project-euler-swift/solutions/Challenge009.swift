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
        // range for the "a" parameter
        let aRange = 1...(tripletSum / 3)
        // calculating the maximum value of "c" parameter
        let cMax = tripletSum / 2
        
        // going through the "a" candidates
        for aCandidate in aRange {
            // calculating range of "b" parameter
            let bMin = cMax - aCandidate
            let bMax = cMax - (aCandidate + 1) / 2
            
            // iterating through the "b" candidates
            for bCandidate in bMin...bMax {
                // calculating "c" candidate
                let cCandidate = tripletSum - aCandidate - bCandidate
                
                // checking if the triplet calculated is a Pythagorean triplet
                guard aCandidate.squared + bCandidate.squared == cCandidate.squared else { continue }
                // if so, we've found the final result
                return aCandidate * bCandidate * cCandidate
            }
        }
        
        // return 0 in case of the search failure
        print("Triplet not found.")
        return 0
    }
}
