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
    
    var root:TrieNode {
        get {
            return TrieNode()
        }
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

func findWordWorker(grid: [[Character]], x: Int , y: Int , root: TrieNode, word:inout String, result: inout [String] ) {
    
}

func findWords( grid: [[Character]], words: [String]) -> [String] {
    
    var t = Trie(words: words).root
    var result:[String] = []
    var s:String = ""
    
    for x in 0..<grid.count {
        for y in 0..<grid[x].count {
            findWordWorker(grid: grid, x: x, y: y, root:t, word: &s, result: &result)
        }
    }
    
    
    
    return []
}



