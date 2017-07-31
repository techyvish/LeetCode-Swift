//
//  Matrix.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 8/1/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

/*
 * clockwise rotate
 * first reverse up to down, then swap the symmetry
 * 1 2 3     7 8 9     7 4 1
 * 4 5 6  => 4 5 6  => 8 5 2
 * 7 8 9     1 2 3     9 6 3
 */

func rotate(_ matrix: inout [[Int]]) {
    matrix.reverse()
    for (i,m) in matrix.enumerated(){
        for j in i+1..<m.count{
            let k = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = k
        }
    }
}

/*
 * anticlockwise rotate
 * first reverse left to right, then swap the symmetry
 * 1 2 3     3 2 1     3 6 9
 * 4 5 6  => 6 5 4  => 2 5 8
 * 7 8 9     9 8 7     1 4 7
 */

func anti_rotate(_ matrix: inout [[Int]]) {

}
