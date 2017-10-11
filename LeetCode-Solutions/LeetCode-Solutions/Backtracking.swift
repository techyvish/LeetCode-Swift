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

func permuteWorker(_ nums: inout [Int],_ start:Int ,_ res: inout [[Int]] ) {
    if ( start == nums.count ) {
        res.append(nums)
        return
    }
    
    for i in start..<nums.count {
        swap(&nums, p: i , q: start)
        permuteWorker(&nums, start + 1 ,&res)
        swap(&nums, p: start , q:i )
    }
}

// Working on same array with different combinations
func permute(_ nums: inout [Int] ) -> [[Int]] {
    var res:[[Int]] = []
    permuteWorker(&nums, 0 , &res)
    return res
}

func combinationsWorker(_ nums: inout[Int] ,_ start: Int , _ tempList: inout [Int], _ list:inout [[Int]]) {

    list.append(tempList)
    for i in start..<nums.count {
        tempList.append(nums[i])
        combinationsWorker(&nums, i + 1 , &tempList, &list)
        tempList.remove(at: tempList.count-1)
    }
    
}

//Working on temporary array with different combinations
func combinations(_ nums: inout[Int] ) -> [[Int]] {
    
    var list:[[Int]] = []
    var tempList:[Int] = []
    combinationsWorker(&nums,0, &tempList, &list)
    return list
    
}
