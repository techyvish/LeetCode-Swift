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

func setKthbit(n:Int ,k:Int){
    var p = n
    p = p & ( 1 << k )
}

func toggleKthPosition(n:Int,k:Int){
    var p = n
    p = p ^ ( 1 << k )
}

func checkKthBitSet(n:Int,k:Int) -> Bool {
    let p = n
    return (p & ( 1 << k)) == 1
}

// 1's complement
func invertEverybitInNumbrerOrOnesComplement(n: Int) -> Int {
    return (~n)
}

func twosCpomplement(n: Int) -> Int {
    return (~n)+1
}

func isPalindromNumber(n:Int) -> Bool {

    var l = 0
    var r = MemoryLayout<Int>.size * 8

    while ( l < r ){
        if ( checkKthBitSet(n: n, k: l) != checkKthBitSet(n: n, k: r) ){
            return false
        }
        l = l + 1
        r = r - 1
    }

    return true
}








