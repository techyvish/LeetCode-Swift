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
