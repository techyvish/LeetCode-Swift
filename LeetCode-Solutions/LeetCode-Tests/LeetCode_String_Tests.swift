//
//  LeetCode_String_Tests.swift
//  LeetCode-Tests
//
//  Created by Vishal Patel on 14/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation
import XCTest

class LeetCode_String_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsIsomorphicStrings() {
        let k = isIsomorphic("ab", "aa")
        XCTAssert(k==false)
    }


    func testForWordPatterns() {
        let str = "abc"
        let pat = "b c a"
        let k = wordPattern(str , pat)
        XCTAssert(k==true)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
