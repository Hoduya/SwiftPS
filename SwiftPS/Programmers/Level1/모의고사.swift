//
//  모의고사.swift
//  SwiftPS
//
//  Created by HoJun on 2022/09/29.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let answerList = [
        [1, 2, 3, 4, 5],
        [2, 1, 2, 3, 2, 4, 2 ,5],
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]
    var scores = [0, 0, 0]
    
    for i in 0..<answers.count {
        for (personIdx, randomAnswers) in answerList.enumerated() {
            let answer = randomAnswers[i % randomAnswers.count]
            if answer == answers[i] {
                scores[personIdx] += 1
            }
        }
    }
    
    let topScore = scores.max()
    var result: [Int] = []
    for i in 0..<scores.count {
        if scores[i] == topScore {
            result.append(i + 1)
        }
    }
    
    return result
}
