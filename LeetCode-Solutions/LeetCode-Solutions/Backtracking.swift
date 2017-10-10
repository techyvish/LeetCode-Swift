//
//  Backtracking.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 10/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

func swap(_ a:inout [Int], p:Int ,q:Int ){
    let t = a[p]
    a[p] = a[q]
    a[q] = t
}

func permuteWorker(_ nums: inout [Int],_ start:Int ,_ a: inout [Int],_ res: inout [[Int]] ) {
    if ( start == nums.count ) {
        res.append(nums)
        return
    }
    
    for i in start..<nums.count {
        swap(&nums, p: i , q: start)
        permuteWorker(&nums, start + 1, &a ,&res)
        swap(&nums, p: start , q:i )
    }
}

func permute(_ nums: inout  [Int] ) -> [[Int]] {
    var a:[Int] = [Int](repeatElement(0, count: nums.count))
    var res:[[Int]] = []
    permuteWorker(&nums, 0, &a, &res)
    return res
}
