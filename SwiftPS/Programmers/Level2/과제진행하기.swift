//
//  과제진행하기.swift
//  SwiftPS
//
//  Created by HoJun on 2023/07/03.
//

import Foundation

func solution(_ plans:[[String]]) -> [String] {
    
    func toSec (_ timeString: String) -> Int {
        let arr = timeString.split(separator: ":")
        return Int(arr[0])! * 60 + Int(arr[1])!
    }
    
    var plans: [(String, Int, Int)] = plans.map {
        return ($0[0], toSec($0[1]), Int($0[2])!)
    }.sorted { $0.1 > $1.1 }
    
    var stops: [(String, Int, Int)] = []
    var result: [String] = []
    var nowTime = plans[0].1
    
    while !plans.isEmpty {
        let cur = plans.removeLast()
        
        guard let next = plans.last else {
            stops.append(cur)
            break
        }
        
        if cur.1 + cur.2 < next.1 {
            nowTime = cur.1 + cur.2
            result.append(cur.0)
            while !stops.isEmpty {
                
                let stop = stops.removeLast()
                
                if nowTime + stop.2 < next.1 {
                    result.append(stop.0)
                    nowTime += stop.2
                } else if nowTime + stop.2 == next.1 {
                    result.append(stop.0)
                    nowTime = next.1
                    break
                } else {
                    let remain = nowTime + stop.2 - next.1
                    stops.append((stop.0, stop.1, remain))
                    nowTime = next.1
                    break
                }
            }
        } else if cur.1 + cur.2 == next.1 {
            nowTime = next.1
            result.append(cur.0)
        } else {
            let remain = cur.1 + cur.2 - next.1
            stops.append((cur.0, cur.1, remain))
            nowTime = next.1
        }
    }
    
    while !stops.isEmpty {
        print(stops.last)
        result.append(stops.removeLast().0)
    }
    
    return result
}


print(solution([["science", "12:00", "50"], ["history", "12:49", "30"], ["Sdf", "13:01", "20"]]))
