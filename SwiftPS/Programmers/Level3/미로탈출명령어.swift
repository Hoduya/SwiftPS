//
//  미로탈출명령어.swift
//  SwiftPS
//
//  Created by HoJun on 2023/06/20.
//

import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    
    let dx = [0, -1, 1, 0]
    let dy = [1, 0, 0, -1]
    let commands = ["d", "l", "r", "u"]
    
    let start = (x, y)
    let finish = (r, c)
    var path: String = "z"
    
    func dfs(point: (Int, Int), moveLog: String) {
        guard path > moveLog else { return }
        
        if moveLog.count == k {
            
            guard point == finish else { return }
                
            if path > moveLog {
                path = moveLog
            }
            return
        }
        
        for i in 0...3 {
            
            let next = (point.0 + dy[i], point.1 + dx[i])
            
            if isValid(point: next) {
                let nextLog = moveLog + commands[i]
                let remainMoveCount = k - nextLog.count
                let distance = distance(p1: next, p2: finish)
                
                if path > nextLog,
                   remainMoveCount >= distance{
                    dfs(point: next, moveLog: nextLog)
                }
            }
        }
    }
    
    func isValid(point: (Int, Int)) -> Bool {
        return 0 < point.0 && point.0 <= n && 0 < point.1 && point.1 <= m
    }
    
    func distance(p1: (Int, Int), p2: (Int, Int)) -> Int{
        return abs(p1.0 - p2.0) + abs(p1.1 - p2.1)
    }
    
    let dist = distance(p1: start, p2: finish)
    
    if dist.isMultiple(of: 2) == k.isMultiple(of: 2) {
        dfs(point: start, moveLog: "")
    }
    
    return path == "z" ? "impossible" : path
}

