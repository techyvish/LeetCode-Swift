//
//  Sorting.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 9/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation


func swap( a:inout [Int], p: Int , q:Int ) {
    let t = a[p]
    a[p] = a[q]
    a[q] = t
}

func partition(  a:inout [Int], p:Int, q:Int ) -> Int {
    let t = p
    let n = q
    var i = t
    for s in t..<n  {
        if a[s] <= a[n] {
            swap(a: &a, p: s, q: i)
            i = i + 1
        }
    }
    swap(a: &a, p: n , q: i)
    return i
}

func quickSort(  a:inout [Int], p: Int, q:Int ) {

    if ( p > q ) {
        return
    }
    
    let n = partition(a: &a, p: p, q: q)
    quickSort(a: &a, p: p , q: n-1)
    quickSort(a: &a, p: n+1 , q: q)
    
}


//----------------------------------------------------------

func mergeSort( a: inout [Int], p: Int , q:Int ){
    
}
