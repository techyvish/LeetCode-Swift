//
//  LeetCode_Tree_Test.swift
//  LeetCode-Tests
//
//  Created by Vishal Patel on 19/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation
import XCTest

class LeetCode_Tree_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }


    func testForHasPathSum() {
        let treeRoot = TreeNode(1)

        let sib1 =  TreeNode(2)
        let sib2 =  TreeNode(3)

        let sib11 =  TreeNode(4)
        let sib12 =  TreeNode(5)

        let sib21 =  TreeNode(6)
        let sib22 =  TreeNode(7)

        treeRoot.left = sib1
        treeRoot.right = sib2

        sib1.left = sib11
        sib1.right = sib12

        sib2.left = sib21
        sib2.right = sib22

        XCTAssertTrue( hasPathSum(treeRoot, 8, 0))
    }

    func testForLeastCommonAncestor() {
        let treeRoot = TreeNode(1)

        let sib1 =  TreeNode(2)
        let sib2 =  TreeNode(3)

        let sib11 =  TreeNode(4)
        let sib12 =  TreeNode(5)

        let sib21 =  TreeNode(6)
        let sib22 =  TreeNode(7)

        treeRoot.left = sib1
        treeRoot.right = sib2

        sib1.left = sib11
        sib1.right = sib12

        sib2.left = sib21
        sib2.right = sib22

        let node = leastCommonAncestor(treeRoot, a: sib12, b: sib21)
        XCTAssertTrue(node!.val == 1)

        let node1 = leastCommonAncestor(treeRoot, a: sib11, b: sib12)
        XCTAssertTrue(node1!.val == 2)
    }

}
