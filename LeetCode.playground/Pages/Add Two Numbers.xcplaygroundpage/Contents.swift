//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard let ll1 = l1 , let ll2 = l2  else {
            return nil
        }
        
        while ll1.next != nil  {
            let temp = ListNode( ll1.val + ll2.val )
        }
        
        return nil
    }
}
