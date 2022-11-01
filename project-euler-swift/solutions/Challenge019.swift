//
//  Challenge019.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 01/11/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=19

struct Challenge019: Challenge {
    
    // input data
    let dateStart = Calendar(identifier: .gregorian).date(from: DateComponents(year: 1901, month: 1, day: 1)).unwrapped
    let dateEnd = Calendar(identifier: .gregorian).date(from: DateComponents(year: 2000, month: 12, day: 31)).unwrapped
    
    func solve() -> Int {
        // count of all Sundays fell on the first of the month in 20th century
        var firstSundaysCount = 0
        
        // initializing first candidate
        var dateCandidate = dateStart
        
        // setting up calendar
        let calendar = Calendar(identifier: .gregorian)
        
        repeat {
            // the first date value is 01.01.2000. Since we're interested in the first days of the months only,
            // we will just add +1 month each time
            dateCandidate = calendar.date(byAdding: .month, value: 1, to: dateCandidate).unwrapped
            
            // checking if the current date (01."N".) fells on Sunday
            if calendar.component(.weekday, from: dateCandidate) == 1 { // 1 == Sunday
                // if so, then increment the Sunday counter value
                firstSundaysCount += 1
            }
        } while dateCandidate < dateEnd
        
        return firstSundaysCount
    }
}
