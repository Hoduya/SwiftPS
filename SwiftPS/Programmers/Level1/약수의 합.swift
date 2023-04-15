//
//  약수의 합.swift
//  SwiftPS
//
//  Created by HoJun on 2022/09/26.
//

import Foundation

func solution(_ n:Int) -> Int {
    guard n > 0 else {return 0}

    var sum = 0
    for num in 1...n {
        if(n.isMultiple(of: num)) {sum += num}
    }
    return sum
}

func solution2(_ n:Int) -> Int {
    return n != 0 ? Array(1...n).filter(n % $0 == 0).reduce(0){ $0 + $1 } : 0
}

solution2(5)
