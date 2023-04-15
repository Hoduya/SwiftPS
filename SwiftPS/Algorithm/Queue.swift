//
//  Queue.swift
//  SwiftPS
//
//  Created by HoJun on 2023/04/15.
//

import Foundation

public struct Queue<T> {
    
    fileprivate var array: [T?] = []
    fileprivate var head: Int = 0
    
    public var isEmpty: Bool {
        self.count == 0
    }
    
    public var count: Int {
        array.count - head
    }

    public var first: T? {
        return isEmpty ? nil : array[head]
    }
    
    public var last: T? {
        return isEmpty ? nil : array.last!
    }
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func pop() -> T? {
        guard head < array.count,
              let popItem = array[head] else { return nil}
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return popItem
    }
}
