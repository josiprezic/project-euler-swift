//
//  Array+IndexOfMax.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 26/11/2022.
//

import Foundation

extension Array where Element: Comparable {
    var indexOfMax: Int? {
        guard let max: Element = self.max() else { return nil }
        return self.firstIndex(of: max)
    }
}
