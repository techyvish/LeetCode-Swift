//
//  LeetCode_LinkedList_Tests.swift
//  LeetCode-Tests
//
//  Created by Vishal Patel on 24/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import XCTest

class LeetCode_LinkedList_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testForLoopDetection() {

        let aa = ListNode(1)
        let bb = ListNode(2)
        let cc = ListNode(3)
        let dd = ListNode(4)
        let ee = ListNode(5)
        let ff = ListNode(6)

        aa.next = bb
        bb.next = cc
        cc.next = dd
        dd.next = ee
        ee.next = ff
        ff.next = dd // Loop

        XCTAssertTrue( detectLoop(aa) )

    }

    func testForFindKthElement() {
        let aa = ListNode(1)
        let bb = ListNode(2)
        let cc = ListNode(3)
        let dd = ListNode(4)
        let ee = ListNode(5)
        let ff = ListNode(6)

        aa.next = bb
        bb.next = cc
        cc.next = dd
        dd.next = ee
        ee.next = ff
        ff.next = nil

        XCTAssertTrue( 4 == findKthElement(3, aa) )
    }

}
