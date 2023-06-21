//
//  표현가능한이진트리.swift
//  SwiftPS
//
//  Created by HoJun on 2023/06/20.
//

import Foundation

import Foundation

func solution(_ numbers:[Int64]) -> [Int] {

    var treeAvailable = true
    var answer: [Int] = []

    numbers.forEach { number in
        let binaryArray = fullBinary(of: number)
        
        treeAvailable = true
        search(arr: binaryArray, isParentZero: false)
        answer.append(treeAvailable ? 1 : 0)
    }
    
    func search(arr: [Int], isParentZero: Bool) {
                
        let midIndex = arr.count / 2
        let mid = arr[midIndex]
            
        if isParentZero && mid == 1 {
            treeAvailable = false
            return
        }
        
        if arr.count > 2 {
            search(arr: Array(arr.prefix(midIndex)), isParentZero: mid == 0)
            search(arr: Array(arr.suffix(midIndex)), isParentZero: mid == 0)
        }
    }
    
    func fullBinary(of number: Int64) -> [Int] {
        
        let binaryString = String(number, radix: 2)
        var binaryArray = binaryString.map{ Int(String($0))! }
        
        let offset = upperLength(length: binaryArray.count) - binaryArray.count
        binaryArray.insert(contentsOf: Array(repeating: 0, count: offset), at: 0)
        
        return binaryArray
    }
    
    func upperLength(length: Int) -> Int{
        var k = 1
        while k <= length {
            k *= 2
        }
        return k - 1
    }
   
    return answer
}
