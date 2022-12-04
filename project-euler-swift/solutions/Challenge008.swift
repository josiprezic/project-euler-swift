//
//  Challenge008.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 08/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=8

struct Challenge008: Challenge {
    
    // input data
    var inputString: String { getInputString() }
    let numberOfDigits = 13
    
    func solve() -> Int {
        // regex used for searching adjacent digits containing 0
        // all these filtered digits have the product value equal
        // to zero, so we can ignore them
        let filteringRegex = "0+.{0,\(numberOfDigits - 1)}0+"
        
        let factors = inputString
            // getting all the rows
            .components(separatedBy: .whitespacesAndNewlines)
            // joining them
            .joined()
            // replacing all the zero-product regex results with 0 to optimize calculations
            .replacingOccurrences(of: filteringRegex, with: "0", options: .regularExpression)
            // converting the string to numbers
            .compactMap(\.wholeNumberValue)
        
        // helper variables
        var candidateArrayStartIndex = 0
        var largestProduct = 0
        
        // calculating the last possible start index
        let candidateArrayStartIndexMax = factors.count - numberOfDigits
        
        // going through all the possible arrays/combinations
        while candidateArrayStartIndex < candidateArrayStartIndexMax {
            // calculating the end index for a given start index
            let candidateArrayEndIndex = candidateArrayStartIndex + numberOfDigits - 1
            // calculating candidate factors
            let candidateArray = factors[candidateArrayStartIndex...candidateArrayEndIndex]
            
            // if it contains 0, then just skip it
            if let lastZeroValueIndex = candidateArray.lastIndex(of: 0) {
                candidateArrayStartIndex = lastZeroValueIndex + 1
                continue
            }
            
            // otherwise calculate a candidate product
            let candidateProduct = candidateArray.reduce(1, *)
            
            // if the current candidate product is the greatest found,
            // then store it's value to the largest product variable
            if candidateProduct > largestProduct {
                largestProduct = candidateProduct
            }
            
            // prepare startIndex for the next iteration
            candidateArrayStartIndex += 1
        }
        return largestProduct
    }
    
    private func getInputString() -> String {
        """
        73167176531330624919225119674426574742355349194934
        96983520312774506326239578318016984801869478851843
        85861560789112949495459501737958331952853208805511
        12540698747158523863050715693290963295227443043557
        66896648950445244523161731856403098711121722383113
        62229893423380308135336276614282806444486645238749
        30358907296290491560440772390713810515859307960866
        70172427121883998797908792274921901699720888093776
        65727333001053367881220235421809751254540594752243
        52584907711670556013604839586446706324415722155397
        53697817977846174064955149290862569321978468622482
        83972241375657056057490261407972968652414535100474
        82166370484403199890008895243450658541227588666881
        16427171479924442928230863465674813919123162824586
        17866458359124566529476545682848912883142607690042
        24219022671055626321111109370544217506941658960408
        07198403850962455444362981230987879927244284909188
        84580156166097919133875499200524063689912560717606
        05886116467109405077541002256983155200055935729725
        71636269561882670428252483600823257530420752963450
        """
    }
}
