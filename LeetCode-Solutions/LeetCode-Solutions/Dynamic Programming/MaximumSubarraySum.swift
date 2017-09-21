//
//  MaximumSubarraySum.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 21/9/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

func maximumSubarray(_ a: [Int] ) -> Int {
    
    var max_so_far = 0
    var max_ending_here = 0
    
    for i in 0..<a.count {
        
        max_ending_here = max_ending_here + a[i]
        
        if max_ending_here < 0 {
            max_ending_here = 0
        }
        
        if ( max_so_far < max_ending_here ) {
            max_so_far = max_ending_here
        }
        
    }

    return max_so_far
    
}
