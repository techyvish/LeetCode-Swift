//
//  Tree.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 8/6/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

public class TreeNode {
    
    public var val:Int
    public var left:TreeNode?
    public var right:TreeNode?
    
    init(val:Int ) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func maxDepth(_ root: TreeNode? ) -> Int  {
    
    if ( root?.left == nil && root?.right == nil ){
        return 0
    }
    
    let left = maxDepth(root!.left) + 1
    let right = maxDepth(root!.right) + 1
    
    return left > right ? left : right
}
