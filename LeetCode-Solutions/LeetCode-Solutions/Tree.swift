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
/*
 Serialize and Deserialize Binary Tree

Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

For example, you may serialize the following tree

     1
    / \
   2   3
      / \
     4   5
 
as "[1,2,3,null,null,4,5]", just the same as how LeetCode OJ serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.

*/


/*
 Given sorted element create binary serach tree
 */

func createBinarySearchTree(arr:[Int]) -> TreeNode? {

    let mid = (arr.count)/2
    let left = createBinarySearchTree(arr: Array( arr[0...mid])) ?? nil
    let right = createBinarySearchTree(arr: Array(arr[mid+1..<arr.count])) ?? nil
    let t = TreeNode(arr[mid])
    t.left = left
    t.right = right
    return t

}

/*
 has path sum : check wether tree has path witch equals to given sum
 */

func hasPathSum(_ root: TreeNode?, _ sum:Int,_ currenSum: Int ) -> Bool {

    if ( root == nil ) {
        return ( currenSum == sum ) ? true : false
    }
    return ( hasPathSum(root!.left, sum,  root!.val + currenSum) || hasPathSum(root!.right, sum,  root!.val + currenSum))

}

/*
 print all paths
 */

func printAllPaths( _ root: TreeNode?,_ list: inout [TreeNode] ){

    if ( root == nil ){
        return
    }

    list.append(root!)
    printAllPaths(root?.left, &list)
    printAllPaths(root?.right, &list)

    if ( root?.left == nil && root?.right == nil ){
        // print path
    }
    list.remove(at: list.index{$0 === root! }!)
}

/*
 Least Common Ancestor
 */

//func leastCommonAncestor(_ root: TreeNode? ) -> TreeNode {
//
//    if ( root?.left == nil && root?.right == nil  ){
//        return root!
//    }
//}




