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

func mergeSortWorker(a: inout [Int], l : Int, m: Int, r: Int ){

    let n1 = m - l + 1
    let n2 = r - m
    
    var L:[Int] = [Int](repeatElement(0, count: n1))
    var R:[Int] = [Int](repeatElement(0, count: n2))

    for i in 0..<n1 {
        L[i] = a[l+i]
    }

    for j in 0..<n2 {
        R[j] = a[m+1+j]
    }

    var i = 0
    var j = 0
    var k = l // Imp: Don't forget you want to only update elements between provided range.

    while  ( i < n1 && j < n2 ) {
        if ( L[i] <= R[j] ){
            a[k] = L[i]
            i = i + 1
        } else {
            a[k] = R[j]
            j = j + 1
        }
        k = k + 1 // keep moving index pointer for main array
    }

    while ( i < n1 ) {
        a[k] = L[i]
        i = i + 1
        k = k + 1
    }

    while ( j < n2 ) {
        a[k] = R[j]
        j = j + 1
        k = k + 1
    }

}

func mergeSort( a: inout [Int], l: Int , r:Int ){
    
    if ( l < r ) {
        
        let m = (l+r)/2

        mergeSort(a: &a , l: l, r: m)
        mergeSort(a: &a , l: m+1, r: r)
        
        mergeSortWorker(a: &a , l: l , m: m , r: r)

    }
    
}


