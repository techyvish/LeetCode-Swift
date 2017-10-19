//
//  Graph.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 19/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

class Vertex : Equatable {
    static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }

    var data:Int = 0
    var neighbours:[Edge] = []

    func addNeighbour(edge: Edge){
        neighbours.append(edge)
    }

}

extension Vertex {
    convenience init(data:Int) {
        self.init()
        self.data = data
        self.neighbours = []
    }
}


class Edge {

    var neighbour: Vertex!
    var weight: Int = 0

    init() {
    }

}


extension Edge {
    convenience init (neighbour: Vertex, weight: Int) {
        self.init()
        self.neighbour = neighbour
        self.weight = weight
    }
}

class Graph {

    var vertices:[Vertex] = []
    var isDirected = false

    func indexOfVertex(_ vertex: Vertex) -> Int? {
        if let i = vertices.index(where: {$0 == vertex}) {
            return i
        }
        return nil;
    }

    func addEdge(source:Vertex, destination:Vertex, weight:Int ){
        let edge = Edge(neighbour: destination, weight: weight)

        vertices[indexOfVertex(source)!].addNeighbour(edge: edge)

        if !isDirected {
            let reverseEdge = Edge(neighbour: source, weight: weight)
            vertices[indexOfVertex(destination)!].addNeighbour(edge: reverseEdge)
        }
    }

    convenience init ( vertices: [Vertex], isDirected: Bool ) {
        self.init()
        self.vertices = vertices
        self.isDirected = isDirected
    }

}

func dfsUtil(_ v:Vertex, _ g:Graph, visited: inout [Bool], _ a: inout [Int]) {

    visited[g.indexOfVertex(v)!] = true
    a.append(v.data)

    for edge in v.neighbours {
        let vertex = edge.neighbour
        if ( visited[g.indexOfVertex(vertex!)!] == false ) {
            dfsUtil(vertex!, g, visited: &visited, &a)
        }
    }

}

func dfs(_ g:Graph,_ a: inout [Int]) {

    var visited:[Bool] = [Bool](repeatElement(false, count: g.vertices.count))
    dfsUtil( g.vertices[0] , g, visited: &visited, &a)

}

func dfsUtilForTopologicalSort(_ v:Vertex, _ g:Graph, visited: inout [Bool], _ a: inout [Int]) {

    visited[g.indexOfVertex(v)!] = true

    for edge in v.neighbours {

        let vertex = edge.neighbour
        if ( visited[g.indexOfVertex(vertex!)!] == false ) {
            dfsUtilForTopologicalSort(vertex!, g, visited: &visited, &a)
        }

    }
    a.append(v.data)

}

func topologicalSort(_ g:Graph,_ a: inout [Int] ){
    var visited:[Bool] = [Bool](repeatElement(false, count: g.vertices.count))
    dfsUtilForTopologicalSort( g.vertices[0] , g, visited: &visited, &a)
}

