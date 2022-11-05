//
//  Challenge021.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 04/11/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=21

struct Challenge021: Challenge {
    
    // input
    let upperLimit = 10_000
    
    func solve() -> Int {
        // creating ContiguousArray of all candidate numbers and calculating
        // sum of divisors for each of them
        let divisorSums = CArray(2...upperLimit).map(sumOfDivisors)
        
        // initializing the result variable and setting the initial sum value to zero
        var resultSum = 0
        
        // the valueOffset constant represents the offset between the array index and
        // the actual candidate value. For example: the first array element is positioned
        // at index=0 and it has the value=2 (2-0=2), the second element is positioned at
        // index=1 and has value=3 (3-1=2), and so on.
        let valueOffset = 2
        
        // checking amicability for all array elements
        divisorSums.indices.forEach { index in
            // calculating values related to the first amicable candidate
            let candidateValue = index + valueOffset
            let candidateSumValue = divisorSums[index]
            
            // performing additional checks to filter unwanted values
            guard candidateSumValue > 1,
                  candidateSumValue < upperLimit,
                  candidateValue != candidateSumValue else {
                return
            }
            
            // calculating the second part of the potential amicable pair
            // by using the values of the first candidate
            let secondAmicableNumberIndex = candidateSumValue - valueOffset
            let secondAmicableNumberCandidateSumValue = divisorSums[secondAmicableNumberIndex]
            
            // at this point we already know that the first candidate divisor sum is equal to
            //the second candidate value, so at this point we have to perfom reversed checking:
            // we want to check if the second candidate divisor sum is equal to the first
            // candidate value
            if secondAmicableNumberCandidateSumValue == candidateValue {
                // if so, then we have found the amicable pair! Our candidate number have just
                // passed all the checks, so we are adding it to the final result sum
                resultSum += candidateValue
            }
        }
        return resultSum
    }
    
    // returns the sum of all the numbers less than given number, which divide
    // evenly into that number
    private func sumOfDivisors(for number: Int) -> Int {
        let isEven = number % 2 == 0
        
        // calculating the max divisor value
        let maxDivisor = isEven ? number / 2 : number / 3
        let divisorCandidatesRange = 1...maxDivisor
        
        // checking and returning the sum of all divisors
        return divisorCandidatesRange.reduce(0) { result, candidate in
            let isDivisor = number % candidate == 0
            return isDivisor ? result + candidate : result
        }
    }
}
