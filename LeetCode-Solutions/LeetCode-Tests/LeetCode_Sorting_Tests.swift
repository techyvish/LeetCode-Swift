//
//  LeetCode_Sorting_Tests.swift
//  LeetCode-Tests
//
//  Created by Vishal Patel on 1/11/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import XCTest

class LeetCode_Sorting_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testForMergeSort() {
        var a = [2,9,6,4,3,7,1,8,5]
        mergeSort(a: &a, l: 0, r: a.count-1)
        XCTAssertEqual(a , [1,2,3,4,5,6,7,8,9])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
