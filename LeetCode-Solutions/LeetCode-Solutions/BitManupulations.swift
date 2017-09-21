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

func getSum(_ a: Int, _ b: Int) -> Int {
    var aa = a
    var bb = b
    var i = 0
    var sum = 0
    while( aa != 0 && bb != 0 ){
        let k = aa & 1
        let r = bb & 1
        let c = k & r
        aa = aa >> 1
        bb = bb >> 1
        let power = NSDecimalNumber(decimal :pow(2, i) )
        sum = sum + c * Int(power)
        i = i + 1
    }
    return sum
}




