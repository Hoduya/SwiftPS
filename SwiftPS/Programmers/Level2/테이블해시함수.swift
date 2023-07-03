//
//  테이블해시함수.swift
//  SwiftPS
//
//  Created by HoJun on 2023/07/03.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    var result: Int = 0
    // 정렬
    var data = data.sorted { l, r in
        return l[col - 1] == r[col - 1] ? l[0] > r[0] : l[col - 1] < r[col - 1]
    }
    
    for i in row_begin - 1...row_end - 1 {
        var sum = 0
        for j in 0..<data[i].count {
            sum += data[i][j] % (i + 1)
        }
        result = result ^ sum
    }
    
    return result
}
