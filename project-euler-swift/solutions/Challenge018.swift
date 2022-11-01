//
//  Challenge018.swift
//  project-euler-swift
//
//  Created by Josip Rezic on 28/10/2022.
//

import Foundation

// challenge description: https://projecteuler.net/problem=18

struct Challenge018: Challenge {
    
    // input data
    let input = getInputString()
    
    func solve() -> Int {
        
        // transforming input string into rows of strings
        let rowsArray = input
        // splitting the input by new lines, so every
        // line becomes a new array element
            .split(separator: "\n")
        // mapping array values back to string
            .map(String.init)
        
        // creating array of arrays which will contain all
        // input data in a comsumable form
        var numberTriangle = Array<Array<Int>>()
        
        rowsArray.forEach {
            // splitting by spaces to get the row elements
            let numberRow = $0.split(separator: " ")
            // mapping array values back to strings
                .map(String.init)
            // and finally mapping it to the Int
                .compactMap(Int.init)
            
            // adding newly created row of elements to
            // the search table object
            numberTriangle.append(numberRow)
        }
        
        // checking if there is at least one element
        // in the search table, otherwise return zero
        if numberTriangle.first?.first == nil {
            return 0
        }
        
        // return the result of the recursive method
        return triangleMaxSum(for: numberTriangle)
    }
    
    // returns the triangle's maximum path sum
    private func triangleMaxSum(for triangle: [[Int]]) -> Int {
        precondition(!triangle.isEmpty && !triangle[0].isEmpty, "The triangle must contain at least one element.")
        
        // every triangle has the top and the top value
        let topValue = triangle[0][0]
        
        // if the height of the triangle is one, then return
        // that one and only value from the top as the triangle sum
        if triangle.count == 1 {
            return topValue
        }
        
        // otherwise add the topValue of that triangle to it's
        // subtriangle topValues. The topValue's value is the
        // only one we can be sure that it will be added to the
        // final sum.
        var triangleCopy = triangle
        triangleCopy[1][0] += topValue
        triangleCopy[1][1] += topValue
        
        // remove the main triangle's top value in order to create
        // his two, left and right, subtriangles
        triangleCopy.removeFirst()
        
        // create triangle subtriangles
        var leftSubtriangle = triangleCopy
        var rightSubtriangle = triangleCopy
        
        // remove unused "side" values for subtriangle
        (0..<triangleCopy.count).forEach { index in
            leftSubtriangle[index].removeLast()
            rightSubtriangle[index].removeFirst()
        }
        
        // find a subtriangle with the higher sum and return it's sum as a final result
        return max(triangleMaxSum(for: leftSubtriangle), triangleMaxSum(for: rightSubtriangle))
    }
    
    private func getInputString() -> String {
        """
        75
        95 64
        17 47 82
        18 35 87 10
        20 04 82 47 65
        19 01 23 75 03 34
        88 02 77 73 07 63 67
        99 65 04 28 06 16 70 92
        41 41 26 56 83 40 80 70 33
        41 48 72 33 47 32 37 16 94 29
        53 71 44 65 25 43 91 52 97 51 14
        70 11 33 28 77 73 17 78 39 68 17 57
        91 71 52 38 17 14 91 43 58 50 27 29 48
        63 66 04 68 89 53 67 30 73 16 69 87 40 31
        04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
        """
    }
}
