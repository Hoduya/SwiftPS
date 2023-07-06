//
//  리코쳇로봇.swift
//  SwiftPS
//
//  Created by HoJun on 2023/07/06.
//

import Foundation

var map: [[Character]]!
var vst: [[Bool]]!

func solution(_ board:[String]) -> Int {
    map = board.map { Array($0) }
    vst = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)
        
    var start: Dot!
    var destination: Dot!
    
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == "R" { start = Dot(x: j, y: i, count: 0) }
            if map[i][j] == "G" { destination = Dot(x: j, y: i, count: 0) }
        }
    }
        
    return bfs(start, destination)
}

func isInMap(x: Int, y: Int) -> Bool {
    return 0 <= x && x < map[0].count && 0 <= y && y < map.count
}

func bfs(_ start: Dot, _ destination: Dot) -> Int {
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    var queue = Queue<Dot>()
    queue.push(start)
    
    while !queue.isEmpty {
        let cur = queue.pop()!
        
        if cur.x == destination.x && cur.y == destination.y {
            return cur.count
        }
        
        for i in 0..<4 {
            
            var x = cur.x
            var y = cur.y
            
            while true {
                let next = (x + dx[i], y + dy[i])
                if !isInMap(x: x + dx[i], y: y + dy[i]) || map[next.1][next.0] == "D" {
                    break
                }
                x += dx[i]
                y += dy[i]
            }

            if isInMap(x: x, y: y) && !vst[y][x] && map[y][x] != "D" {
                vst[y][x] = true
                queue.push(Dot(x: x, y: y, count: cur.count + 1))
            }
        }
    }
    
    return -1
}

struct Dot {
    let x: Int
    let y: Int
    let count: Int
}

struct Queue<T> {
    
    private var array: [T?] = []
    private var head: Int = 0
    
    var isEmpty: Bool {
        count == 0
    }
    
    var count: Int {
        array.count - head
    }
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func pop() -> T? {
        guard head < array.count,
            let item = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        return item
    }
}
