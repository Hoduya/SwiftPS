//
//  File.swift
//  SwiftPS
//
//  Created by HoJun on 2022/09/30.
//

func solution(_ s:String) -> String {
    return s.split(separator: " ").map{
        var str = $0.lowercased()
        return str.removeFirst().uppercased() + str
    }.joined(separator: " ")
}
