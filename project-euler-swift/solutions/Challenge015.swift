//
//  Challenge015.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 15/01/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=15

struct Challenge015: Challenge {
    let gridSize = 20
    
    func solve() -> Int {
        let matrixSize = gridSize + 1
        var matrix: CMatrix<Int> = .createMatrix(of: matrixSize)
        
        for row in 0..<matrixSize {
            for column in 0..<matrixSize {
                matrix[row][column] = latticePathCount(row: row, column: column, in: matrix)
            }
        }
        return matrix.last?.last ?? 0
    }
    
    private func latticePathCount(row: Int, column: Int, in matrix: CMatrix<Int>) -> Int {
        if row == 0 || column == 0 { return 1 }
        let aboveCellValue = matrix[row - 1][column]
        let rightCellValue = matrix[row][column - 1]
        return aboveCellValue + rightCellValue
    }
}
