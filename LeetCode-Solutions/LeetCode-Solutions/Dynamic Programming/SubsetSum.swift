//
//  SubsetSum.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 8/9/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation
/*
* Given an array of non negative numbers and a total, is there subset of numbers in this array which adds up
* to given total. Another variation is given an array is it possible to split it up into 2 equal
* sum partitions. Partition need not be equal sized. Just equal sum.
*
* Time complexity - O(input.size * total_sum)
* Space complexity - O(input.size*total_sum)
*
*/
struct SubsetSum {

    static func subsetSum( input:[Int], total: Int ) -> Bool {
        
        let a  = [Bool](repeating:false, count:total + 1)
        var dp = [[Bool]](repeating:a, count:input.count + 1)
        
        for i in 1...input.count {
            dp[i][0] = true
        }
        
        for i in 1...input.count {
            for j in 1...total {
                
                if ( j < input[i-1] ) {
                    dp[i][j] = dp[i-1][j]
                } else {
                    dp[i][j] = dp[i-1][j] || dp[i-1][j-input[i-1]]
                }
            }
        }
        
        return dp[input.count][total]
        
    }
    
}
