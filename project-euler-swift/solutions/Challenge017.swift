//
//  Challenge017.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 23/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=17

struct Challenge017: Challenge {
    func solve() -> Int {
        
        // input data
        let numberMin = 1
        let numberMax = 1000
        let numberRange = (numberMin...numberMax)
        
        // creating number formatter used for mapping numbers to text values
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        // calculating number of letters for the given numbers
        let numbersLetterCount = numberRange
            // converting numbers to string by using number formatter
            .map(formatter.string)
            // making values non-optional
            .compactMap { $0 }
            // removing dashes since we do not want to count them
            .map { $0.replacingOccurrences(of: "-", with: "") }
            // removing empty spaces since we do not want to count them
            .map { $0.replacingOccurrences(of: " ", with: "") }
            // counting letters for each number
            .map(\.count)
            // calculating the sum of the upper counts
            .reduce(0, +)
        
        // unfortunately, the number formatter we used does not support
        // British spelling, so we have to find the additional ANDs and
        // calculate the sum of their letters as well
        let additionalANDsLetterCount = numberRange
            // filter numbers lower than 100, since they do not contain
            // the additional AND word
            .filter { $0 > 100 }
            // filter other numbers which does't have AND word in itself as well
            .filter { !$0.isMultiple(of: 100) }
            // multiply their count with 3, since AND word has three letters
            .count * 3
            
        // sum two upper results and return the final result
        return numbersLetterCount + additionalANDsLetterCount
    }
}
