//
//  배달수거.swift
//  SwiftPS
//
//  Created by HoJun on 2023/05/11.
//

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var answer: Int = 0
    
    var delivery = 0
    var pickup = 0
    
    for i in (0..<n).reversed() {
        if deliveries[i] == 0 && pickups[i] == 0 {
            continue
        }
        
        var visitCount = 0
        
        while deliveries[i] > delivery || pickups[i] > pickup {
            delivery += cap
            pickup += cap
            visitCount += 1
        }
        
        delivery -= deliveries[i]
        pickup -= pickups[i]
        
        answer += visitCount * (2 * (i + 1))
    }
    return Int64(answer)
}
