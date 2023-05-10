//
//  롤케잌자르기.swift
//  SwiftPS
//
//  Created by HoJun on 2023/05/08.
//

import Foundation

func solution(_ topping:[Int]) -> Int {
    
    var result: Int = 0
    
    // 토핑 종류 별 개수 파악
    var toppingCounts = Array(repeating: 0, count: 10001)
    topping.forEach { category in
        toppingCounts[category] += 1
    }
        
    // 토핑 종류 개수 파악
    var categoryCount = toppingCounts.filter { $0 > 0 }.count
    
    // 한 사람이 먹을 수 있는 토핑 셋
    var visitedSet = Set<Int>()
    
    // 순차 탐색
    for category in topping {
        
        // 먹을 수 있는 토핑 종류 개수 파악
        visitedSet.insert(category)
        
        // 남은 토핑 개수 파악
        toppingCounts[category] -= 1
        
        // 남은 토핑 개수가 0 이면
        // 남은 토핑 종류 개수 -1
        if toppingCounts[category] == 0{
            categoryCount -= 1
        }
        
        // 먹을 수 있는 토핑 종류 개수와
        // 남은 토핑 종류 개수가 같으면 공평한 경우
        if categoryCount == visitedSet.count {
            result += 1
        }
     
        // 남은 토핑 종류 개수가 작으면 탐색 종료
        if categoryCount < visitedSet.count {
            break
        }
    }
    
    return result
}
