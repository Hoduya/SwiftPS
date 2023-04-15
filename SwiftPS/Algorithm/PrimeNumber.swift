//
//  PrimeNumber.swift
//  SwiftPS
//
//  Created by HoJun on 2023/04/15.
//

import Foundation

func isPrimeNumber(_ number: Int) -> Bool {
    
    guard number > 1 else { return false }
    
    for num in 2...Int(sqrt(Double(number)) + 1) {
        if number % num == 0 {
            return false
        }
    }
    return true
}
