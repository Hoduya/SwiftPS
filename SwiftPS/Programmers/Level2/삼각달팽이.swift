//
//  삼각달팽이.swift
//  SwiftPS
//
//  Created by HoJun on 2022/10/10.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    var number = 1
    var row = 0
    var col = 0
    var iter = 0
    var count = n
    
    while(count > 0) {
        if iter % 3 == 0 {
            for _ in 0..<count {
                arr[row][col] = number
                row += 1
                number += 1
            }
            row -= 1
            col += 1
        }
        
        else if iter % 3 == 1 {
            for _ in 0..<count {
                arr[row][col] = number
                col += 1
                number += 1
            }
            row -= 1
            col -= 2
        }
        
        else {
            for _ in 0..<count {
                arr[row][col] = number
                row -= 1
                col -= 1
                number += 1
            }
            row += 2
            col += 1
        }
        
        count -= 1
        iter += 1
    }

    return arr.map{$0.filter{$0 != 0}}.flatMap{$0}
}

