//
//  main.swift
//  SwiftPS
//
//  Created by HoJun on 2023/04/15.
//

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    let lion: [Int] = Array(repeating: 0, count: 11)
    var highScore: Int = -1
    var highScoreArray: [Int] = [-1]
    
    func dfs(_ index: Int, _ remainCount: Int, _ lion: [Int]) {
        var lionCopy = lion
        
        if remainCount == 0 {
            
            let currentScore = score(apeach: info, lion: lion)
            
            if highScore < currentScore {
                highScore = currentScore
                highScoreArray = lionCopy
            }
            
            if highScore == currentScore {
                let high = highScoreArray.enumerated().reduce(0) { $0 + $1.element * (10 - $1.offset) }
                let current = lionCopy.enumerated().reduce(0) { $0 + $1.element * (10 - $1.offset) }
                if high > current {
                    highScore = currentScore
                    highScoreArray = lionCopy
                }
            }
                        
            return
        }
        
        guard index < 11 else { return }
        
        for i in 0...remainCount {
            lionCopy[index] = i
            dfs(index + 1, remainCount - i, lionCopy)
        }
    }
    
    func score(apeach: [Int], lion: [Int]) -> Int{
        
        var apeachScore: Int = 0
        var lionScore: Int = 0
        
        (0...10).forEach { index in
            
            
            let score = 10 - index
            if lion[index] == 0 && apeach[index] == 0 {
                
            }
            else if lion[index] > apeach[index] { lionScore += score }
            else { apeachScore += score }
        }
        
        return lionScore - apeachScore
    }
    
    
    dfs(0, n, lion)
        
    return highScoreArray
}


