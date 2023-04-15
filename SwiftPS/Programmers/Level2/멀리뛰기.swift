//
//  멀리뛰기.swift
//  SwiftPS
//
//  Created by HoJun on 2022/10/02.
//

func solution(_ n:Int) -> Int {
    // 5칸 뛰는 경우의 수는
    // 3칸 뛰는 경우 2칸 더 뛰기
    // 5칸 뛰는 경우 1칸 더 뀌기 -> dp 수열
    if(n < 3) {return n}
    
    var dp = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 1234567
    }
    
    return dp[n]
}
