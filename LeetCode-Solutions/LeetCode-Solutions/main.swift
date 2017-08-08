//
//  main.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 7/28/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation


let subsetSumResult = SubsetSum.subsetSum(input: [2,3,5,6], total: 8)

let rabinKarp = RabinKarpSearch()
let rabinKarpResult = rabinKarp.patternExist("abcdefghi","ghi")

let a = hammingDistance(1, 4)
print(a)

let b = hammingWeight(4)
print(b)

var m:[[Int]] = [[1,2,3],[4,5,6],[7,8,9]]
rotate(&m)

let aa = ListNode(1)
let bb = ListNode(2)
let cc = ListNode(3)
let dd = ListNode(4)
aa.next = bb
bb.next = cc
cc.next = dd
let ee = reverseList(aa)

