//
//  Solution1.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 7/28/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var count:Int  = 0
    var xx = x
    var yy = y
    while ( xx != 0 || yy != 0 ){
        count += (xx & 1) ^ (yy & 1)
        xx = xx >> 1
        yy = yy >> 1
    }
    return count
}

func hammingWeight(_ n:Int) -> Int  {
    var nn = n
    var count:Int  = 0
    while ( nn != 0 ){
        count += (nn & 1)
        nn = nn >> 1
    }
    return count
}



