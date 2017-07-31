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

func reverseList(_ head: ListNode?) -> ListNode? {
    var curr:ListNode? = head
    var prev:ListNode? = nil
    
    while ( curr != nil ) {
        let temp = curr?.next
        curr?.next = prev
        prev = curr
        curr = temp
    }
    return prev
}

func reverseList_recursive(_ head: ListNode?) -> ListNode? {
    if ( head == nil || head?.next == nil ) {
        return head
    }
    let _ = reverseList_recursive(head?.next)
    head?.next?.next = head
    head?.next = nil // Don't forget this o/w list will end up in cycle.
    return head
}

