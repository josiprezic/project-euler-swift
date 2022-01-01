//
//  Challenge001.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 01/01/2022.
//

import Foundation

struct Challenge001: Challenge {
    func solve() -> Int {
        var sum = 0
        Array(1..<1000).forEach {
            guard $0.isMultiple(of: 3) || $0.isMultiple(of: 5) else { return }
            sum += $0
        }
        return sum
    }
}
