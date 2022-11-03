//
//  Challenge020.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 02/11/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=20

struct Challenge020: Challenge {
    
    // input data
    let input: Int = 100
    
    func solve() -> Int {
        // range of factors used to calculate the result factorial
        let factors = 2...input
        
        // calculating result digits. Every digit has it's own index in the
        // resultDigitsArray. It starts from the initial result == 1
        // presented in a resultDigits array as [1]
        let resultDigits = factors.reduce([1]) { result, factor in
            // multiplying every digit of the current result value
            // with the current factor without moving carry over
            // value to the next digit
            let multiplied = result.map { $0 * factor}
            // normalizing the result and moving carry over digits to the proper
            // places, so that every array element contains exactly one digit
            return normalize(multiplied)
        }
        // calculating the sum of digits and returning it as a final result
        return resultDigits.reduce(0, +)
    }
    
    // used to apply the multiplication carry over step on all result digits
    private func normalize(_ resultDigits: [Int]) -> [Int] {
        // reversing the array to make it easier to operate on it
        var reversed = Array(resultDigits.reversed())
        // initializing initial carry over value
        var carry = 0
        
        // normalizing every array element, so that it contains only
        // single digit
        reversed = reversed.map { normalizableDigit in
            let normalizableWithCarry = normalizableDigit + carry
            let normalizedDigit = normalizableWithCarry % 10
            carry = (normalizableWithCarry - normalizedDigit) / 10
            return normalizedDigit
        }
        
        // now all the array elements are normalized, but there's
        // still the carry value which have to be somehow applied
        // to get the correct final result
        
        // adding carry over values to the final result
        String(carry)
            // separating the number digits
            .map(String.init)
            .map(Int.init)
            // reversing the array to make it easier to operate on it
            .reversed()
            .compactMap { $0 }
            .forEach { carryDigit in
                // appending the carry over digit to the final result
                reversed.append(carryDigit)
            }
        
        // reversing the array back again and returing it as a result
        return reversed.reversed()
    }
}
