//
//  숫자변환하기.swift
//  SwiftPS
//
//  Created by HoJun on 2023/07/08.
//

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var dp: [Int] = Array(repeating: -1, count: 1000001)
    let nums = [n, 2, 3]
    dp[x] = 0
    
    for i in x...y {
        guard dp[i] != -1 else { continue }
        
        for j in 0...2 {
            let next = j == 0 ? i + nums[j] : i * nums[j]
            
            guard next <= y else { continue }
            
            if dp[next] == -1 {
                dp[next] = dp[i] + 1
            } else if dp[next] != -1 {
                dp[next] = min(dp[i] + 1, dp[next])
            }
        }
    }
    
    return dp[y]
}
