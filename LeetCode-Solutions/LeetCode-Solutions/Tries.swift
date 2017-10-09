//
//  Tries.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 10/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation


class TrieNode {
    
    var is_end:Bool = false
    var children:[TrieNode] = []
    
}
class Trie {
    
    init(words:[String]) {
        root = TrieNode()
        for word in words {
            addWord(word: word)
        }
    }
    
    func addWord(word:String) {
        
        for i in word.map({$0}) {
            let index = i - Character("a")
        }
        
    }
    
    private
        var root:TrieNode
    
    
}
