//
//  x만큼간격이있는n개의숫자.swift
//  SwiftPS
//
//  Created by HoJun on 2022/09/26.
//

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    var num = x
    var arr: [Int64] = []
    for _ in 1...n {
        arr.append(Int64(num))
        num += x
    }
    return arr
}

func solution2(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map{ Int64($0 * x) }
}
