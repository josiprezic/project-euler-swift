//
//  Challenge025.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 24/11/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=25

struct Challenge025: Challenge {
    
    // input data
    let numberOfDigits = 1_000
    
    func solve() -> Int {
        // initialize first two Fibonacci sequence elements
        var firstNumberDigits = [1]
        var secondNumberDigits = [1]
        
        // set index counter to 1 (0, 1) since we already have two first elements
        var resultIndex = 1
        
        // repeat until finding the first number with the given number of digits
        while secondNumberDigits.count < numberOfDigits {
            // calculate the sum of the last two calculated Fibonacci
            // sequence elements to get the value of the next one
            let sum = sum(a: &firstNumberDigits, b: secondNumberDigits)
            
            // move values to the proper variables
            firstNumberDigits = secondNumberDigits
            secondNumberDigits = sum
            
            // increment result index
            resultIndex += 1
        }
        
        // returning the index of the first element with the given number of digits
        return resultIndex
    }
    
    // returns the sum of two numbers presented as Int arrays, as an array of sum digits
    private func sum(a: inout [Int], b: [Int]) -> [Int] {
        
        // add missing zeroes if needed
        if a.count < b.count {
            a.insert(0, at: 0)
        }
        
        // combine two arrays into one by summing the elements on the same indexes
        var sum = zip(a, b).map(+)
        
        // helper variable used to store carry information
        var carry = 0
        
        // normalizing the sum to get the array of single digits per element
        sum.indices.reversed().forEach { index in
            // adding the carry value from the previous index
            let newElementValue = sum[index] + carry
            
            // if the element is already normalized than do nothing
            guard newElementValue > 10 else {
                sum[index] = newElementValue
                carry = 0
                return
            }
            
            // otherwise, calculate normalized element value
            carry = newElementValue / 10
            // and store the rest to the carry value
            sum[index] = newElementValue % 10
        }
        
        // append carry digits to the final sum if needed
        if carry != 0 {
            sum.insert(carry, at: 0)
        }
        // returning the array of sum digits
        return sum
    }
}
