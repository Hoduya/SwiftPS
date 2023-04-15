//
//  소수만들기.swift
//  SwiftPS
//
//  Created by HoJun on 2022/10/10.
//

import Foundation

func solution(_ numbers:String) -> Int {
    let nums = Array(numbers)
    var vst = Array(repeating: false, count: nums.count)
    var primeSet = Set<Int>()
    var comb = ""
    var count = 0
    
    func dfs() {
        for i in 0..<nums.count {
            guard !vst[i] else { continue }
            vst[i] = true
            comb.append(String(nums[i]))
            if isPrime(Int(comb)!) {
                count += 1
                primeSet.insert(Int(comb)!)
            }
            dfs()
            comb.removeLast()
            vst[i] = false
        }
    }
    
    func isPrime(_ num: Int) -> Bool {
        guard num > 1 else { return false }
        for i in 2..<Int(sqrt(Double(num)) + 1) {
            if num % i == 0 { return false }
        }
        return true
    }
    
    dfs()

    return primeSet.count
}
