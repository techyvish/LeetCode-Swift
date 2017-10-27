//
//  LeetCode_Hash_Tests.swift
//  LeetCode-Tests
//
//  Created by Vishal Patel on 27/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import XCTest

class LeetCode_Hash_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testForLRUCache() {

        var cache = LRUCache(capacity: 2)
        cache.put(key: 1, val: 1)
        cache.put(key: 2, val: 2)
        cache.get(key: 1)
        cache.put(key: 3, val: 3)
        XCTAssertTrue( -1 == cache.get(key: 2))
        cache.put(key: 4,val: 4);    // evicts key 1
        XCTAssertTrue( -1 == cache.get(key: 1))

    }

}
