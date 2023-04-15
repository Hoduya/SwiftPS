//
//  부족한금액계산하기.swift
//  SwiftPS
//
//  Created by HoJun on 2022/09/27.
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let answer = Int64(money - (price * count * (1 + count) / 2))
    return answer >= 0 ? 0 : -answer
}


print(solution(3, 20, 4))
