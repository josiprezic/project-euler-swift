//
//  Challenge004.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 04/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=4

struct Challenge004: Challenge {
    let factorMin = 100
    let factorMax = 999
    
    func solve() -> Int {
        var maxPolindrome = 0
        
        for factorOne in factorMin...factorMax {
            for factorTwo in factorOne...factorMax {
                let product = factorOne * factorTwo
                guard product > maxPolindrome, product.isPalindrome else { continue }
                maxPolindrome = product
            }
        }
        return maxPolindrome
    }
}
