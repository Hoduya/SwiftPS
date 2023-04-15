//
//  영어끝말잇기.swift
//  SwiftPS
//
//  Created by HoJun on 2022/10/01.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    // set
    // 매번 카운트
    // 카운트 % 사람 수 -> 번호
    // 카운트 / 사람 수 -> 차례
    var wordSet = Set<String>()
    var count = 0
    var startLetter = words[0].first
    for word in words {
        if startLetter != word.first || !wordSet.insert(word).inserted { break }
        startLetter = word.last
        count += 1
    }
    
    return count == words.count ? [0,0] : [count % n + 1, count / n + 1]
}
