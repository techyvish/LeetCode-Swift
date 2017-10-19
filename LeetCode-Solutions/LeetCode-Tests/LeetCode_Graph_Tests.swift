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

    var directedG:Graph!
    var undirectedG:Graph!

    override func setUp() {
        super.setUp()
        let a = Vertex(data: 1)
        let b = Vertex(data: 2)
        let c = Vertex(data: 3)
        let d = Vertex(data: 4)

        undirectedG = Graph(vertices: [a,b,c,d], isDirected: false)
        undirectedG.addEdge(source: a, destination: b, weight: 10)
        undirectedG.addEdge(source: a, destination: c, weight: 9)
        undirectedG.addEdge(source: a, destination: d, weight: 11)
        undirectedG.addEdge(source: b, destination: d, weight: 15)

        directedG = Graph(vertices: [a,b,c,d], isDirected: true)
        directedG.addEdge(source: a, destination: b, weight: 10)
        directedG.addEdge(source: a, destination: c, weight: 9)
        directedG.addEdge(source: b, destination: d, weight: 11)
        directedG.addEdge(source: c, destination: d, weight: 15)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testForDFS() {
        var a:[Int] = []
        dfs(undirectedG,&a)
        XCTAssertTrue( a == [1,2,4,3] )
    }

    func testForBFS() {

    }

    func testForTopologicalSort() {
        var a:[Int] = []
        topologicalSort(directedG,&a)
        XCTAssertTrue( (a.reversed() == [1,3,2,4]) || (a.reversed() == [1,2,3,4]) )
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
