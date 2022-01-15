//
//  Array+Matrix.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 15/01/2022.
//

import Foundation

extension Array {
    static func createMatrix(of size: Int, defaultElementValue: Int = 0) -> [[Int]] {
        Array<Array<Int>>(repeating: Array<Int>(repeating: defaultElementValue, count: size), count: size)
    }
    
    func asSquareMatrix() -> [[Int]] where Element == Int {
        let size = Int(self.count.root)
        var matrix = [[Int]]()
        
        for row in 0..<size {
            let rowMin = row * size
            let rowMax = rowMin + size - 1
            let rowArray = Array(self[rowMin...rowMax])
            matrix.append(rowArray)
        }
        return matrix
    }
}
