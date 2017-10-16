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
    }

    override func tearDown() {
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

    func testForWordBreakSimple() {
        wordBreak("leetcode",dict: ["leet","codee"])
    }

    func testForWordBreak2() {
        let k = wordBreak2("ABCD",dict:["AB", "CD", "ABC", "D"])
        XCTAssertTrue(k == ["AB CD", "ABC D"])
    }

}
