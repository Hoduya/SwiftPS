//
//  올바른괄호.swift
//  SwiftPS
//
//  Created by HoJun on 2022/10/01.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var ans = true
    var stack: [Character] = []
    
    for char in s {
        if char == "(" { stack.append(char)}
        else if char == ")" {
             if stack.popLast() != "(" {
                 ans = false
                 break
             }
        } else { break }
    }

    return stack.count == 0 && ans
}

