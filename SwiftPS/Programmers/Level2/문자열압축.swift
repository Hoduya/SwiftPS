//
//  문자열압축.swift
//  SwiftPS
//
//  Created by HoJun on 2023/07/10.
//

import Foundation

func solution(_ s:String) -> Int {
    let s = Array(s)
    var result = Int.max
    
    guard s.count > 2 else { return s.count }
        
    for len in 1...s.count / 2 {
        var preWords = s[0..<len]
        var totalLength = len
        var sameCount = 1
        for i in stride(from: len, through: s.count - len, by: len) {
            print( s[i..<(i + len)] )
            let curWords = s[i..<(i + len)]
            if curWords == preWords {
                sameCount += 1
                continue
            }
            else {
                preWords = curWords
                totalLength += len
                if sameCount > 1 { totalLength += String(sameCount).count }
                sameCount = 1
            }
        }
        if sameCount > 1 {
            totalLength += String(sameCount).count
        }
        if s.count % len != 0 {
            totalLength += s.count % len
        }
        print(totalLength)
        result = min(totalLength, result)
    }
    
    return result
}
