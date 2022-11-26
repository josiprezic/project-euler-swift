//
//  Challenge026.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 25/11/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=26

struct Challenge026: Challenge {
   
    // input data
    let upperBound = 1_000
    
    func solve() -> Int {
        precondition(upperBound > 0, "Upper bound has to be highter than 0.")
        // creating the range of candidates
        let candidates = (1..<upperBound)
        // calculating recurrying cycle coount for each of them
        let recurringCycleCounts = candidates.map(recurringCycleCount)
        // finding the index of max value
        let indexOfMax = recurringCycleCounts.indexOfMax
        // calculating it's position by increasing index value by 1
        return (indexOfMax ?? 0) + 1
    }
    
    // returns the recurring cycle length of a decimal fraction part for a given number.
    private func recurringCycleCount(for number: Int) -> Int {
        // instead of calculating the decimal fraction part and checking it's content to
        // find the recurring cycle, we're just creating a list of all remainders calculated.
        var remainders = [Int]()
        
        // all the fractions have the numerator equal to 1
        var currentRemainder = 1
        
        // calculating remainders till reaching 0 value. Once we reach 0, it means that there
        // is no remainder left and we've calculated all the values of the decimal fraction
        // for a given number
        while currentRemainder != 0 {
            // adding current remainder calculated in the previous loop
            remainders.append(currentRemainder)
            // calculating the next remainter
            currentRemainder = currentRemainder * 10 % number
            // if we get the same reminder for a second time, then we know that the cycle
            // of reminders has just closed and we can return the result
            if remainders.contains(currentRemainder) {
                return remainders.count
            }
        }
        
        // returned in the case of reaching value of 0
        return remainders.count
    }
}
