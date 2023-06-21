//
//  두원사이의정수쌍.swift
//  SwiftPS
//
//  Created by HoJun on 2023/06/21.
//

import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    
    var r1Count: Int = 0
    var r2Count: Int = 0
    var borderCount: Int = 0
    
    r1Count += r1
    for x in 1...(r1) {
        let y = sqrt(pow(Double(r1), 2) - pow(Double(x), 2))
        borderCount += ceil(y) == floor(y) ? 1 : 0
        r1Count += Int(y)
    }
    r1Count -= borderCount
    r1Count *= 4
    

    r2Count += r2
    for x in 1...(r2) {
        r2Count += Int(sqrt(pow(Double(r2), 2) - pow(Double(x), 2)))
    }
    r2Count *= 4
            
    let answer = Int64(r2Count - r1Count)
    
    return answer
}
