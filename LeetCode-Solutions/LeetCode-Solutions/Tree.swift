//
//  Tree.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 8/6/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

public class TreeNode : CustomStringConvertible {
    
    public var val:Int
    public var left:TreeNode?
    public var right:TreeNode?
    
    init(_ val:Int ) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public var description: String {
        return "\(val)"
    }
}

func buildTree() -> TreeNode? {
    
    let treeRoot = TreeNode(20)
    
    let sib1 =  TreeNode(15)
    let sib2 =  TreeNode(25)
    
    let sib11 =  TreeNode(10)
    let sib12 =  TreeNode(17)
    
    let sib21 =  TreeNode(23)
    let sib22 =  TreeNode(30)
    
    treeRoot.left = sib1
    treeRoot.right = sib2
    
    sib1.left = sib11
    sib1.right = sib12
    
    sib2.left = sib21
    sib2.right = sib22
    
    return treeRoot
}



struct TreeSolutions {
    
    static func maximumDepth( _ root: TreeNode?) -> Int {
        
        if ( root == nil ){
            return 0
        }
        
        print(root!.description)
        let leftMax = maximumDepth(root!.left) // put every node on the left side into the stack 
        
        // pop node from the stack and put every child node on the right side in the stack
        // if it has a left child put every childeren of the child in the stack.
        // this step will evaluate right subtree of the node when it poped back from the stack.
        print(root!.description)
        let rightMax = maximumDepth(root!.right)
        
        if ( leftMax > rightMax ) {
            return leftMax + 1
        }else {
            return rightMax + 1
        }
        
    }
    
    
    static func diameter( _ root: TreeNode?) -> Int {
        
        let leftMax = maximumDepth(root!.left) // put every node on the left side into the stack
        let rightMax = maximumDepth(root!.right)
        return  rightMax + 1 + leftMax
        
    }
    
    

}
