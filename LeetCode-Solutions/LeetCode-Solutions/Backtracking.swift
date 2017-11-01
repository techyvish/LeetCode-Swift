//
//  Backtracking.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 10/10/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation

func swap(_ a:inout [Int], p:Int ,q:Int ){
    let t = a[p]
    a[p] = a[q]
    a[q] = t
}

func permuteWorker(_ nums: inout [Int],_ start:Int ,_ res: inout [[Int]] ) {
    if ( start == nums.count ) {
        res.append(nums)
        return
    }
    
    for i in start..<nums.count {
        swap(&nums, p: i , q: start)
        permuteWorker(&nums, start + 1 ,&res)
        swap(&nums, p: start , q:i )
    }
}

// Working on same array with different combinations
func permute(_ nums: inout [Int] ) -> [[Int]] {
    var res:[[Int]] = []
    permuteWorker(&nums, 0 , &res)
    return res
}

func combinationsWorker(_ nums: inout [Int] ,_ start: Int , _ tempList: inout [Int], _ list:inout [[Int]]) {

    list.append(tempList)
    for i in start..<nums.count {
        tempList.append(nums[i])
        combinationsWorker(&nums, i + 1 , &tempList, &list)
        tempList.remove(at: tempList.count-1)
    }
    
}

//Working on temporary array with different combinations
func combinations(_ nums: inout[Int] ) -> [[Int]] {
    
    var list:[[Int]] = []
    var tempList:[Int] = []
    combinationsWorker(&nums,0, &tempList, &list)
    return list
    
}

// Recursion in depth
func recursion(_ currentLoop:Int ,_ noOfLoops:Int ,_ noOfIterations: Int, _ v: inout [Int] ) {
    
    if ( currentLoop == noOfLoops ) {
        print(v)
        return
    }
    
    for i in 1...noOfIterations {
        v[currentLoop] = i
        recursion( currentLoop + 1 , noOfLoops, noOfIterations, &v )
    }

}

func test() {
    var v:[Int] = [Int](repeatElement(0, count: 3))
    recursion(0, 3, 3, &v )
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

func subString(_ s:String,_ start:Int,_ end:Int ) -> String {
    let startIdx = s.index(from: start)
    let endIdx = s.index(from: end)
    let range = startIdx..<endIdx
    return s.substring(with: range)
}


/*
Given a pattern and a string str, find if str follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty substring in str.

Examples:
pattern = "abab", str = "redblueredblue" should return true.
pattern = "aaaa", str = "asdasdasdasd" should return true.
pattern = "aabb", str = "xyzabcxzyabc" should return false.
Notes:
You may assume both pattern and str contains only lowercase letters.
*/


func wordBreakTemplateHelper(_ s:String,_ start:Int) {
    if ( start == s.count ) {
        return
    }
 
    for end in start + 1...s.count {
        let aa = subString(s, start, end)
        print(aa)
        wordBreakTemplateHelper(s , end)
    }

    return
}
	
func wordBreakTemplate(_ s:String ){
    let k = wordBreakTemplateHelper(s, 0)
}

/*
 Given a string s and a dictionary of words dict, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

 For example, given
 s = "leetcode",
 dict = ["leet", "code"].

 Return true because "leetcode" can be segmented as "leet code".
*/

func wordBreakHelper(_ s:String,_ start:Int,_ dict:[String]) -> Bool {
    if ( start == s.count ) {
        return true
    }

    for word in dict {
        let len = word.count
        let end = start + len


        if ( end > s.count) {
            continue
        }

        let aa = subString(s, start, end)
        print(aa)

        if ( aa == word ) {
            if (wordBreakHelper(s , end, dict)) {
                return true
            }
        }
    }

    return false
}

func wordBreak(_ s:String, dict:[String] ){
    let k = wordBreakHelper(s, 0, dict )
}

/*
Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. You may assume the dictionary does not contain duplicate words.

Return all such possible sentences.

For example, given
s = "catsanddog",
dict = ["cat", "cats", "and", "sand", "dog"].

A solution is ["cats and dog", "cat sand dog"].
*/


func wordBreak2Helper(_ s:String,_ start:Int,_ dict:[String]) -> [String] {

    var res:[String] = []
    if ( start == s.count ) {
        res.append("")
        return res
    }


    for end in start + 1...s.count {

        let aa = subString(s, start, end)
        if ( dict.contains(aa) ) {

            let r  = wordBreak2Helper(s , end, dict)
            for w in r {
                res.append(aa + ( w == "" ? "" : " ") + w)
            }
        }
        
    }

    return res
}

func wordBreak2(_ s:String, dict:[String]) -> [String] {
    let k = wordBreak2Helper(s, 0, dict )
    return k
}


/*
 Given a pattern and a string str, find if str follows the same pattern.

 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.

 Examples:
 pattern = "abba", str = "dog cat cat dog" should return true.
 pattern = "abba", str = "dog cat cat fish" should return false.
 pattern = "aaaa", str = "dog cat cat dog" should return false.
 pattern = "abba", str = "dog dog dog dog" should return false.
 Notes:
 You may assume pattern contains only lowercase letters, and str contains lowercase letters separated by a single space.
*/

func wordPattern(_ pattern: String, _ string: String) -> Bool {
    var wordDict = [String:Character]()
    var charDict = [Character:String]()

    let charArr = [Character](pattern.characters)
    let words = string.characters.split(separator: " ").map(String.init)

    guard charArr.count == words.count   else {
        return false
    }

    for i in 0..<charArr.count {

        let currentWord = words[i]
        let currentChar = charArr[i]

        if ( wordDict[currentWord] == nil && charDict[currentChar] == nil ){
            wordDict[currentWord] = currentChar
            charDict[currentChar] = currentWord
        } else {
            if wordDict[currentWord] != currentChar {
                return false
            }
        }

    }

    return true
}

/*
 Given a pattern and a string str, find if str follows the same pattern.

 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty substring in str.

 Examples:
 pattern = "abab", str = "redblueredblue" should return true.
 pattern = "aaaa", str = "asdasdasdasd" should return true.
 pattern = "aabb", str = "xyzabcxzyabc" should return false.
 Notes:
 You may assume both pattern and str contains only lowercase letters.
 */

func wordPattern2Helper(_ pattern:[Character],_ str:String,_ i:Int,_ j:Int,_ map: inout [String:String] ) -> Bool {

    if ( i == pattern.count && j == str.count ){
        return true
    }

    if ( i >= pattern.count || j >= str.count ){
        return false
    }


    let c = pattern[i]

    for k in j+1...str.count {

        let sub = subString(str, j, k)
        if !map.keys.contains(String(c)) &&  !map.values.contains(sub) {
            map[String(c)] = sub
            if wordPattern2Helper(pattern, str, i + 1, k, &map) {
                return true
            }
            map.removeValue(forKey: String(c))
        }else {
            if map.keys.contains(String(c)) && map[String(c)] == sub {
                if wordPattern2Helper(pattern, str, i + 1, k, &map) {
                    return true
                }
            }
        }

    }
    return false

}

func wordPattern2(_ pattern:String,_ str:String) ->  Bool {

    var map:[String:String] = [:]
    let p = [Character](pattern.characters)
    return wordPattern2Helper(p, str, 0, 0, &map)

}

/*
 Given two strings s and t, determine if they are isomorphic.

 Two strings are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.

 For example,
 Given "egg", "add", return true.
 Given "foo", "bar", return false.
 Given "paper", "title", return true.
 Note:
 You may assume both s and t have the same length.
 */

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var stDict = [Character: Int]()
    var tsDict = [Character: Int]()

    let sChars = [Character](s.characters)
    let tChars = [Character](t.characters)

    guard sChars.count == tChars.count else {
        return false
    }

    for i in 0..<sChars.count {
        if ( stDict[sChars[i]] != tsDict[tChars[i]] ) {
            return false
        }
        stDict[sChars[i]] = i + 1
        tsDict[tChars[i]] = i + 1
    }

    return true
}

/*
Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.

The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 */

func isValidSudoku(_ board:[[Character]]) -> Bool {

    return false
}

/*
    Permutation II

     [
     [1,1,2],
     [1,2,1],
     [2,1,1]
     ]
 */

func permuteUniqueWorker(_ a:inout [Int] ,_ start: Int,_ res: inout [[Int]],_ used:inout [Bool]) {

    print(used)
    if ( start == a.count - 1){
        res.append(a)
        return
    }

    for i in start..<a.count {
        if ( used[i] == true || ( i > 0 && a[i] == a[i-1] && !used[i-1])) {
            print(used)
            continue
        }
        used[i] = true
        swap(&a, p: i , q: start)
        permuteUniqueWorker(&a, start + 1 ,&res, &used)
        used[i] = false
        swap(&a, p: start , q:i )
    }

}

func permuteUnique(_ a:[Int] ) -> [[Int]] {
    var k = a
    var res:[[Int]] = []
    var used:[Bool] = [Bool](repeatElement(false, count: a.count))
    permuteUniqueWorker(&k,0,&res,&used)
    return res
}

func phoneNumbrerLetterCombinationsWorker(_ numbers:[Character:[Character]],_ start:Int,_ input:[Character], _ res:inout [[Character]] ,_ j:Int,_ temp:inout [Character]) {

    if ( start == input.count ) {
        // clean up
        if ( !temp.contains(" ") ) {
        	res.append(temp)
        }
        return
    }

    for j in 0..<4 {
        temp.append(numbers[input[start]]![j])
        phoneNumbrerLetterCombinationsWorker(numbers, start + 1, input, &res, j + 1, &temp)
        temp.removeLast()
    }

}

func phoneNumbrerLetterCombinations() {

    var numbers:[Character:[Character]] = [:]
    numbers["2"] = ["a","b","c"," "]
    numbers["3"] = ["d","e","f"," "]
    numbers["4"] = ["g","h","i"," "]
    numbers["5"] = ["j","k","l"," "]
    numbers["6"] = ["m","n","o"," "]
    numbers["7"] = ["p","q","r","s"]
    numbers["8"] = ["s","t","u"," "]
    numbers["9"] = ["w","x","y","z"]

    var res:[[Character]] = []
    var temp:[Character] = []
    phoneNumbrerLetterCombinationsWorker(numbers,0,[Character]("23".characters) ,&res, 0, &temp )
    print(res)
    
}

/*
     Palindrom partitioning
     inout : "aab"
     output : [["aa","b"],
               ["a","b","c"]]
 */

