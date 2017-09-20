//
//  LinkedList.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 7/28/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

public class ListNode {
    public var val:Int
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
    
    if ( l1!.val < l2!.val) {
        l1!.next = mergeTwoLists(l1?.next, l2) // Insight: Either l1 or l2 returned here that is assigend to link in previous node.
        return l1
    } else {
        l2!.next  = mergeTwoLists(l1, l2?.next) // Insight: Either l1 or l2 returned here
        return l2
    }
    
}

func mergeTwoListsIterative(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var a1 = l1
    var a2 = l2
    
    if l1 == nil {
        return l2
    }
    
    if l2 == nil {
        return l1
    }
    
    var head:ListNode? = nil
    if ( a1!.val < a2!.val ) {
        head = a1
    }else {
        head = a2
    }
    
    while (a1 != nil && a2 != nil ) {
    
        if ( a1!.val < a2!.val ) {
            let temp = a1?.next
            a1?.next = a2
            a1 = temp
        } else {
            let temp = a2?.next
            a2?.next = a1
            a2 = temp
        }
        
    }
    
    return head
    
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

