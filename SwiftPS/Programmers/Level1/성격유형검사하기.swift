//
//  성격유형검사.swift
//  SwiftPS
//
//  Created by HoJun on 2022/09/30.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var result = ""
    var points = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    
    for (idx, str) in survey.enumerated() {
        if choices[idx] == 4 { continue }
        else if choices[idx] > 4 { points[String(str.last!)]! += choices[idx] }
        else { points[String(str.first!)]! += choices[idx] }
    }
    
    result += getType(points, "R", "T")
    result += getType(points, "C", "F")
    result += getType(points, "J", "M")
    result += getType(points, "A", "N")
    
    return result
}

func getType(_ points: [String : Int], _ first: String, _ second: String) -> String {
    if(points[first]! == points[second]!) {
        return min(first, second)
    } else {
        return points[first]! > points[second]! ? first : second
    }
}
