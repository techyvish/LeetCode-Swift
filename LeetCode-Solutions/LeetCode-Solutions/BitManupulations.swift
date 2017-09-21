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

func reverseBits() -> Int {
    
    return 0
}

func getSum(_ aa: Int, _ bb: Int) -> Int {

    var a = aa
    var b = bb
    
    var sum = a
    
    while ( b != 0 ){
        sum = a ^ b  // Do the sum without carry
        b = ( a & b ) << 1 // Calculate the carry
        a = sum //
    }
    
    return sum
    
}




