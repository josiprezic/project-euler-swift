//
//  Int+Math.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 10/01/2022.
//

import Foundation

extension Int {
    var squared: Int {
        self * self
    }
    
    var root: Double {
        sqrt(Double(self))
    }
    
    var isPalindrome: Bool {
        "\(self)" == String("\(self)".reversed())
    }
}
