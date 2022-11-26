//
//  Date+Unwrapped.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 01/11/2022.
//

import Foundation

extension Optional<Date> {
    var unwrapped: Date { self! }
}
