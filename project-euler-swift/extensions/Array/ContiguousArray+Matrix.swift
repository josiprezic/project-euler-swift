//
//  ContiguousArray+Matrix.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 30/10/2022.
//

typealias CArray = ContiguousArray
typealias CMatrix<T> = ContiguousArray<ContiguousArray<T>>

extension CArray {
    static func createMatrix(of size: Int, defaultElementValue: Int = 0) -> CMatrix<Int> {
        CMatrix<Int>(repeating: CArray<Int>(repeating: defaultElementValue, count: size), count: size)
    }
    
    func asSquareMatrix() -> CMatrix<Int> where Element == Int {
        let size = Int(self.count.root)
        var matrix = CMatrix<Int>()
        matrix.reserveCapacity(size)
        
        for row in 0..<size {
            let rowMin = row * size
            let rowMax = rowMin + size - 1
            let rowArray = CArray(self[rowMin...rowMax])
            matrix.append(rowArray)
        }
        return matrix
    }
}
