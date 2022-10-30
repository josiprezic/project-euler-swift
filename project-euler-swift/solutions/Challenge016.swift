//
//  Challenge016.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 22/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=16

struct Challenge016: Challenge {
    let base = 2
    let exponent = 1_000
    
    func solve() -> Int {
        var resultDigits = ContiguousArray(arrayLiteral: base)
        
        for _ in 1..<exponent {
            var carry = 0
            for index in 0..<resultDigits.count {
                let multipliedDigitResult = resultDigits[index] * base + carry
                
                guard multipliedDigitResult > 9 else {
                    resultDigits[index] = multipliedDigitResult
                    carry = 0
                    continue
                }
                
                resultDigits[index] = multipliedDigitResult % 10
                carry = 1
                
                if index == resultDigits.count - 1, carry == 1 {
                    resultDigits.append(1)
                    carry = 0
                }
            }
        }
        
        return resultDigits.reduce(0, +)
    }
}
