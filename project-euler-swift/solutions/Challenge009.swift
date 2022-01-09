//
//  Challenge009.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 09/01/2022.
//

import Foundation

struct Challenge009: Challenge {
    let tripletSum = 1_000
    
    func solve() -> Int {
        let aRange = 1...(tripletSum / 3)
        
        var bMin = 0
        var bMax = 0
        
        let cMax = tripletSum / 2
        var cCandidate = 0
        
        for aCandidate in aRange {
            bMin = cMax - aCandidate
            bMax = cMax - (aCandidate + 1) / 2
            for bCandidate in bMin...bMax {
                cCandidate = tripletSum - aCandidate - bCandidate
                guard aCandidate.squared + bCandidate.squared == cCandidate.squared else { continue }
                return aCandidate * bCandidate * cCandidate
            }
        }
        print("Triplet not found.")
        return 0
    }
}

private extension Int {
    var squared: Int { self * self }
}
