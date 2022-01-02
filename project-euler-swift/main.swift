//
//  main.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 01/01/2022.
//

import Foundation

var challenges: [Challenge] = [
    Challenge001(),
    Challenge002()
]

print("Challenge number (1-\(challenges.count)): ")

if let input = readLine(),
   let challengeId = Int(input),
   challengeId > 0,
   challengeId <= challenges.count {
    let challenge = challenges[challengeId - 1]
    printResults(for: challenge)
} else {
    print("Invalid parameter")
}

func printResults(for challenge: Challenge) {
    let startTime = CFAbsoluteTimeGetCurrent()
    let solution = challenge.solve()
    print("Solution: \(solution)")
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    let timeElapsedRounded = round(timeElapsed * 1_000) / 1_000
    print("Time elapsed: \(timeElapsedRounded) seconds")
}
