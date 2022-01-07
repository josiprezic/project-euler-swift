//
//  ChallengeStore.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 07/01/2022.
//

import Foundation

struct ChallengeStore {
    static var challenges: [Challenge] {
        [
            Challenge001(),
            Challenge002(),
            Challenge003(),
            Challenge004(),
            Challenge005(),
            Challenge006(),
            Challenge007(),
            Challenge008()
        ]
    }
}
