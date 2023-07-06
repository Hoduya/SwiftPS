//
//  점찍기.swift
//  SwiftPS
//
//  Created by HoJun on 2023/07/04.
//

import Foundation

struct Dot {
    let x: Int
    let y: Int
    let count: Int
}

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result = 0
    
    for x in stride(from: 0, through: d, by: k) {
        let y = Int(sqrt(pow(Double(d), 2.0) - pow(Double(x), 2.0)))
        result += y / k
    }
    
    result += d / k + 1
    
    return Int64(result)
}

func bts() {
    
}
