//
//  멀쩡한사각형.swift
//  SwiftPS
//
//  Created by HoJun on 2023/05/04.
//

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    guard min(w, h) != 1 || w != h else { return Int64((w * h) - max(w, h)) }
    
    let gcd = GCD(w, h)
    let longLen = max((w / gcd), (h / gcd))
    let shortLen = min((w / gcd), (h / gcd))
    
    return Int64((w * h) - (longLen + shortLen - 1) * gcd)
}

func GCD(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return GCD(b, a % b)
}
