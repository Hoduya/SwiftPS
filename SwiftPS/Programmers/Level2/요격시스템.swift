//
//  요격시스템.swift
//  SwiftPS
//
//  Created by HoJun on 2023/05/14.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    
    let targets = targets.sorted {
        return $0[1] < $1[1]
    }
    
    var answer = 1
    var endPoint = targets[0][1]
    
    for target in targets {
        if endPoint <= target[0] {
            answer += 1
            endPoint = target[1]
        }
    }
    
    return answer
}


