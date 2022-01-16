//
//  Challenge014.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 14/01/2022.
//

import Foundation

struct Challenge014: Challenge {
    let startNumberMax = 1_000_000
    
    func solve() -> Int {
        var collatzCountMax = 0
        var collatzNumberMax = 0
        
        var resultCandidates = Set(2...startNumberMax)
        
        while !resultCandidates.isEmpty {
            let collatzNumberCandidate = resultCandidates.popFirst() ?? 0
            let collatzCountCandidate = collatzSequenceCount(for: collatzNumberCandidate, candidatesArray: &resultCandidates)
            
            if collatzCountMax < collatzCountCandidate {
                collatzCountMax = collatzCountCandidate
                collatzNumberMax = collatzNumberCandidate
            }
        }
        return collatzNumberMax
    }
    
    private func collatzSequenceCount(for number: Int, candidatesArray: inout Set<Int>) -> Int {
        var number = number
        var count = 0
        
        while number != 1 {
            if !number.isMultiple(of: 2) {
                number = 3 * number + 1
                candidatesArray.remove(number)
                count += 1
            }
            number /= 2
            candidatesArray.remove(number)
            count += 1
        }
        return count
    }
}
