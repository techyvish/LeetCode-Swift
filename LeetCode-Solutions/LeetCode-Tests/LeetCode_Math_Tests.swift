//
//  LeetCode_Math_Tests.swift
//  LeetCode-Tests
//
//  Created by Vishal Patel on 24/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import XCTest

class LeetCode_Math_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testForDecToBinIsPalindrom() {

        XCTAssertTrue(decToBinIsPalindrom(585))
        XCTAssertFalse(decToBinIsPalindrom(22))

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
