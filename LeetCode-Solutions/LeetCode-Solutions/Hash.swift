//
//  Hash.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 27/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Cocoa


struct LRUCache {
    private var capacity:Int
    private var valDict:[Int:Int] = [:]
    private var cntDict:[Int:Int] = [:]
    private var counter:Int = 0

    init(capacity:Int){
        self.capacity = capacity
    }

    mutating func put(key:Int, val:Int ) {
        guard valDict[key] == nil else {
            return
        }

        guard  counter < self.capacity else {
            let sortedDict = cntDict.sorted(by: { (t1, t2) -> Bool in
                return t1.value < t2.value
            })
            let hi = sortedDict.first
            let lo = sortedDict.last
            valDict.remove(at: valDict.index(forKey: (hi?.key)!)!)
            cntDict.remove(at: cntDict.index(forKey: (hi?.key)!)!)
            
            valDict[key] = val
            cntDict[key] = (lo?.value)! + 1

            return
        }

        valDict[key] = val
        cntDict[key] = 0

        counter += 1

    }

    mutating func get(key:Int) -> Int {

        if ((valDict[key]) != nil) {
            cntDict[key] = cntDict[key]! + 1
            return valDict[key]!

        }
        return -1
    }

}

