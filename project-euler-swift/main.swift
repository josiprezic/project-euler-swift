//
//  main.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 01/01/2022.
//

import Foundation

var challenges = [
    Challenge001.self
]

print("Challenge number (1-\(challenges.count)): ")

if let input = readLine(),
   let challengeId = Int(input),
   challengeId > 0,
   challengeId <= challenges.count {
    let challenge = challenges[challengeId - 1].init()
    let solution = challenge.solve()
    print("Solution: \(solution)")
} else {
    print("Invalid parameter")
}
