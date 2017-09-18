//
//  ClimbStairs.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 18/9/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

struct ClimbStairs {
    
    static func numOfWays(n : Int ) -> Int {
        
        var dp =  [Int](repeating:0, count:n + 4)
        
        dp[0] = 1
        dp[1] = 1
        dp[2] = 2
        
        if n < 3 {
            return dp[n]
        }
        
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n]
        
    }
}
