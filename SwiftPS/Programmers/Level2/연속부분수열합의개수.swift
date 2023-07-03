//
//  연속부분수열합의개수.swift
//  SwiftPS
//
//  Created by HoJun on 2023/06/27.
//

import Foundation

func solution(_ elements:[Int]) -> Int {
    var numbers = elements
    var sumSet = Set<Int>()
    numbers.append(contentsOf: numbers)
    
    for windowSize in 1...elements.count {
        var sum = numbers.prefix(windowSize).reduce(0, +)
        sumSet.insert(sum)
        for i in windowSize..<numbers.count {
            sum += numbers[i]
            sum -= numbers[i - windowSize]
            sumSet.insert(sum)
        }
    }
    
    return sumSet.count
}
