//
//  StringAlgorithms.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 8/6/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

struct StringManipulations {
    static func shiftString(k:Int, s:String) -> String {
        var arr = s.characters.map { $0 }
        var result = s.characters.map { $0 }
        
        for i in 0..<arr.count {
            let idx = (i+k) % arr.count
            result[idx] = arr[i]
        }
        return String(result)
    }
}

struct RabinKarpSearch {
    
    func patternExist(_ string:String,_ pattern:String) -> Int {
        return -1
    }
    
}
