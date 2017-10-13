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

func combinationsWorker(_ nums: inout [Int] ,_ start: Int , _ tempList: inout [Int], _ list:inout [[Int]]) {

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

// Recursion in depth
func recursion(_ currentLoop:Int ,_ noOfLoops:Int ,_ noOfIterations: Int, _ v: inout [Int] ) {
    
    if ( currentLoop == noOfLoops ) {
        print(v)
        return
    }
    
    for i in 1...noOfIterations {
        v[currentLoop] = i
        recursion( currentLoop + 1 , noOfLoops, noOfIterations, &v )
    }

}

func test() {
    var v:[Int] = [Int](repeatElement(0, count: 3))
    recursion(0, 3, 3, &v )
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

func subString(_ s:String,_ start:Int,_ end:Int ) -> String {
    let startIdx = s.index(from: start)
    let endIdx = s.index(from: end)
    let range = startIdx..<endIdx
    return s.substring(with: range)
}

func word_break(_ s:String,_ start:Int ,_ str:inout [String] ) -> [String] {
    var res:[String] = []
    if ( start == s.count ) {
        res.append("")
        return res
    }
 
    for end in start + 1...s.count {
        let list = word_break(s , end, &str)
        print(list)
        let aa = subString(s, start, end)
        print("\(start)...\(end) -> \(aa)")
        res.append(aa)
        
    }
    
    return res
}
	
func wordBreak(_ s:String ){
    var str:[String] = []
    let k = word_break(s, 0, &str)
}









