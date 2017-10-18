//
//  Graph.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 19/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

struct Vertex : Equatable {
    static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }

    var data:Int
    var neighbours:[Edge] = []

    mutating func addNeighbour(edge: Edge){
        neighbours.append(edge)
    }

}

extension Vertex {
    init(data:Int) {
        self.data = data
        self.neighbours = []
    }
}


struct Edge {

    var neighbour: Vertex
    var weight: Int

}

struct Graph {

    var vertices:[Vertex]
    var isDirected = false

    func indexOfVertex(_ vertex: Vertex) -> Int? {
        if let i = vertices.index(where: {$0 == vertex}) {
            return i
        }
        return nil;
    }

    mutating func addEdge(source:Vertex, destination:Vertex, weight:Int ){
        let  edge = Edge(neighbour: destination, weight: weight)

        vertices[indexOfVertex(source)!].addNeighbour(edge: edge)

        if !isDirected {
            let reverseEdge = Edge(neighbour: source, weight: weight)
            vertices[indexOfVertex(destination)!].addNeighbour(edge: reverseEdge)
        }
    }

}

func dfs(_ graph:Graph) {


}



