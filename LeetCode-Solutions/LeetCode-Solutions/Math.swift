//
//  Math.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 24/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation


func decToBinIsPalindrom(_ n:Int ) -> Bool {

    var arr:[Int] = []
    var k = n
    while k  != 0 {
        let p = k % 2
        k = k / 2
        arr.append(p)
    }

    return isPalindrom(a: arr
        , i: 0, j: arr.count-1)
}

func isPalindrom(a:[Int], i:  Int , j: Int ) -> Bool {

    if ( i >= j ){
        return true
    }

    if ( a[i] == a[j] ){
        return isPalindrom(a: a, i: i+1, j: j-1)
    } else {
        return false
    }
}

func decToBinIsPalindrom2(_ n:Int ) -> Bool {

    var d = 0
    var k = n
    while k  != 0 {
        d = k % 2
        k = k / 2
    }

    var rev:Int = 0
    var a:Int = 0
    while ( n != 0 ){
        d = d  % 10
        k = k / 10
        rev = rev * 10 + d
        a = rev
    }

    if ( a==rev) {
        return true
    }
    return false
}

