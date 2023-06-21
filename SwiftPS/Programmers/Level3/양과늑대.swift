//
//  양과늑대.swift
//  SwiftPS
//
//  Created by HoJun on 2023/06/14.
//

/*
 DFS + 백트래킹
 재귀적으로 DFS 호출 하면서 한 페이즈마다 모든 엣지를 확인.
 단 방문 순서를 지키기 위해 부모 방문 O & 자식 노드 방문 X 인 경우에만 다음 페이즈로.
 갈 수 없는 노드 프루닝 & 갈 수 있으면 다음 노드에서 양과 늑대의 개수 업데이트 후 새로운 페이즈.
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
