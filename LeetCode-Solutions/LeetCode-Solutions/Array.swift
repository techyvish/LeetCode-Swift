//
//  Array.swift
//  LeetCode-Solutions
//
//  Created by Vishal Patel on 20/9/17.
//  Copyright © 2017 Vishal Patel. All rights reserved.
//

import Foundation


func moveZeros(_ a: inout [Int] ) {
    
    let n = a.count
    
    for i in 0..<n {
        
        if ( a[i] == 0 ) {
            
            for j in i..<n-1 {
                a[j] = a[j+1]
            }
            a[n-1] = 0
        }
        
    }
    
}

func moveZerosOptimized(_ a: inout [Int] ) {

    var j = 0
    for i in 0..<a.count {
        if ( a[i] != 0 ){
            a[j] = a[i]
            j = j + 1
        }
    }
    
    for k in j..<a.count {
        a[k] = 0
    }
}



func plusOneOptimized(_ digits: [Int]) -> [Int] {
    
    var result = digits
    var reminder = 1
    for i in ( 0..<digits.count ).reversed() {
        
        let digit = digits[i] + reminder
        if ( digit  < 10 ){
            result[i] = digit
            return result
        }else {
            result [i] = 0
            reminder = 1
        }
    }
    
    if ( reminder > 0 ){
        result.insert(1, at: 0)
    }

    return result

}


func plusOne(_ digits: [Int]) -> [Int] {

    var total:[Int] = []
    var carry = 0
    var sum = 0
    for i in stride(from: digits.count-1, to: -1, by: -1) {
        
        if i == digits.count-1 {
            sum = digits[i] + 1
        } else {
            sum = digits[i] + carry
        }
        
        if sum/10 == 0 {
            total.append(sum)
        } else {
            carry = sum/10
            total.append(sum%10)
        }
    }
    if ( carry != 0 ){
        total.append(carry)
    }

    return total.reversed()
}

