//
//  Challenge004.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 04/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=4

struct Challenge004: Challenge {
    
    // input data
    let factorMin = 100
    let factorMax = 999
    
    func solve() -> Int {
        // a palindromic number reads the same both ways
        var maxPolindrome = 0
        
        // iterating over first factor
        for factorOne in factorMin...factorMax {
            // iterating over second factor
            for factorTwo in factorOne...factorMax {
                // calculating product candidate
                let product = factorOne * factorTwo
                // checking if the product is the largest palindrome we've found
                guard product > maxPolindrome, product.isPalindrome else { continue }
                // if so, store it's value to the maxPalindrome
                maxPolindrome = product
            }
        }
        return maxPolindrome
    }
}
