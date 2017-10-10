//
//  Tries.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 10/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

extension Character {
    func asciiValue() -> Int {
        return Int(String(self).unicodeScalars.map{ $0.isASCII ? $0.value : 0 }.first!)
    }
}

class TrieNode {
    
    var is_end:Bool = false
    var children:[TrieNode?] = []
    
    init() {
        for _ in 0..<26 {
            children.append(nil)
        }
    }
    
}

class Trie {
    
    private var root:TrieNode = TrieNode()
    
    func getRoot() -> TrieNode {
        return root
    }
    
    init(words:[String]) {
        for word in words {
            addWord(word: word)
        }
    }
    
    private func addWord(word:String) {
        var current = root
        for i in word.map({$0}) {
            let index = i.asciiValue() - Character("a").asciiValue()
            if (  current.children[index] == nil ){
                current.children[index] = TrieNode()
            }
            current = current.children[index]!
        }
        current.is_end = true
    }

}

func findWordWorker(grid:inout [[Character]], x: Int , y: Int , root: TrieNode, word:inout String, result: inout [String] ) {
    
    if ( x < 0 || x >= grid.count || y < 0 || y >= grid[0].count || grid[x][y] == " " ){
        return
    }
    var root = root
    if ( root.children[grid[x][y].asciiValue() - Character("a").asciiValue()] != nil ) {
        word = word + String(grid[x][y])
        root = root.children[grid[x][y].asciiValue() - Character("a").asciiValue()]!
        if ( root.is_end == true ){
            result.append(word)
        }
        let c = grid[x][y]
        grid[x][y] = " "
        findWordWorker(grid: &grid, x: x - 1 ,  y: y , root: root, word: &word, result: &result)
        findWordWorker(grid: &grid, x: x + 1 ,  y: y , root: root, word: &word, result: &result)
        findWordWorker(grid: &grid, x: x  , y: y - 1 , root: root, word: &word, result: &result)
        findWordWorker(grid: &grid, x: x  , y: y + 1 , root: root, word: &word, result: &result)
        grid[x][y] = c
        
    }
    
}

/*
 Given a 2D board and a list of words from the dictionary, find all words in the board.
 
 Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.
 
 For example,
 Given words = ["oath","pea","eat","rain"] and board =
 
 [
 ['o','a','a','n'],
 ['e','t','a','e'],
 ['i','h','k','r'],
 ['i','f','l','v']
 ]
 Return ["eat","oath"].
 */

func findWords( grid: inout [[Character]], words: [String]) -> [String] {
    
    let t = Trie(words: words).getRoot()
    var result:[String] = []

    var s:String = ""
    for x in 0..<grid.count {
        for y in 0..<grid[x].count {
            s = ""
            findWordWorker(grid: &grid, x: x, y: y, root:t, word: &s, result: &result)
        }
    }
    return result
}



