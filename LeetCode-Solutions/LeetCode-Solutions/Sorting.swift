//
//  Sorting.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 9/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

// QuickSort
func swap( a:inout [Int], p: Int , q:Int ) {
    let t = a[p]
    a[p] = a[q]
    a[q] = t
}

func partition(  a:inout [Int], p:Int, q:Int ) -> Int {
    var k = p
    let n = q
    for i in p..<n  {
        // choose last element as pivote
        // if current element is smaller than last
        // exchange curren with counter
        // increment counter & current
        if a[i] <= a[n] {
            swap(a: &a, p: i, q: k)
            k = k + 1
        }
    }
    
    // swap last element with counter
    // Fix last elemnt's position in array.
    swap(a: &a, p: n , q: k)
    return k // return the position
}

func quickSort(  a:inout [Int], p: Int, q:Int ) {

    if ( p > q ) {
        return
    }
    
    let n = partition(a: &a, p: p, q: q)
    quickSort(a: &a, p: p , q: n-1)
    quickSort(a: &a, p: n+1 , q: q)
    
}

// MergeSort
//----------------------------------------------------------

func mergeSortWorker(a: inout [Int], p : Int, m: Int, q: Int ){
    
    
    let n1 = m-p
    let n2 = q-m
    
    var L:[Int] = []
    for i in 0..<n1 {
        L.append(a[i])
    }
    
    var R:[Int] = []
    for j in 0..<n2 {
        R.append(a[j])
    }
    
    
}

func mergeSort( a: inout [Int], p: Int , q:Int ){
    
    if ( p < q ) {
        
        let m = q/2
        mergeSort(a: &a , p: p, q: m)
        mergeSort(a: &a , p: m+1, q: q)
        
        mergeSortWorker(a: &a,p: p,m: m,q: q)

    }
    
}


