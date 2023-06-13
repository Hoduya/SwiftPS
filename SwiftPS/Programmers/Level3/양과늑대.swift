//
//  양과늑대.swift
//  SwiftPS
//
//  Created by HoJun on 2023/06/14.
//

/*
    DFS + 백트래킹
    :
 */

import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    
    var graph: [Int: [Int]] = [:]
    var vst = Array(repeating: false, count: info.count)
    var total = 0
    
    vst[0] = true
    dfs(sheep: 1, wolf: 0)
    
    func dfs(sheep: Int, wolf: Int) {
        if sheep <= wolf {
            return
        }
        
        total = max(sheep, total)
        
        for edge in edges {
            let parent = edge[0]
            let child = edge[1]
            
            if vst[parent] && !vst[child] {
                vst[child] = true
                let childAnimal = info[child] == 0 ? (1, 0) : (0, 1)
                dfs(sheep: sheep + childAnimal.0, wolf: wolf + childAnimal.1)
                vst[child] = false
            }
        }
    }
        
    return total
}
