//
//  LeetCode_Graph_Tests.swift
//  LeetCode-Tests
//
//  Created by Vishal Patel on 19/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation
import XCTest

class LeetCode_Graph_Tests: XCTestCase {

    var g:Graph!

    override func setUp() {
        super.setUp()
        let a = Vertex(data: 1)
        let b = Vertex(data: 2)
        let c = Vertex(data: 3)
        let d = Vertex(data: 4)

        g = Graph(vertices: [a,b,c,d], isDirected: false)
        g.addEdge(source: a, destination: b , weight: 10)
        g.addEdge(source: a, destination: c , weight: 9)
        g.addEdge(source: a, destination: d , weight: 11)
        g.addEdge(source: b, destination: d , weight: 15)

    }

    override func tearDown() {
        super.tearDown()
    }

    func testForDFS() {
        dfs(g)
    }

    func testForBFS() {

    }

    func testForTopologicalSort() {

    }

    func testForEdgeTest() {

    }

    func testForCycle() {

    }

    func testForConnectedComponents() {

    }

    func testForDjkstra() {

    }



}
