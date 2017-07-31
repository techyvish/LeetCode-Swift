//
//  LinkedList.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 7/28/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

public class ListNode {
    public var val:Int?
    public var next:ListNode?
    public init(_ val:Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
 
    if l1 == nil {
        return l2
    }
    
    if l2 == nil {
        return l1
    }
    
    return l1
}

