//
//  미로탈출.swift
//  SwiftPS
//
//  Created by HoJun on 2023/07/06.
//

import Foundation

import Foundation

var S: Dot!
var E: Dot!
var L: Dot!
var map: [[Character]]!
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func solution(_ maps:[String]) -> Int {
    map = maps.map { Array($0) }
    
    for y in 0..<map.count {
        for x in 0..<map[y].count {
            if map[y][x] == "S" {S = Dot(x, y)}
            if map[y][x] == "E" {E = Dot(x, y)}
            if map[y][x] == "L" {L = Dot(x, y)}
        }
    }
    
    let Ltime = bfs(S, L)
    guard Ltime != -1 else { return -1 }
    let Etime = bfs(L, E)
    guard Etime != -1 else { return -1 }
    
    return Ltime + Etime
}

func bfs(_ start: Dot, _ end: Dot) -> Int {
    var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)
    var queue = Queue<Dot>()
    queue.push(start)
    
    while !queue.isEmpty {
        var cur = queue.pop()
        
        if cur.x == end.x && cur.y == end.y {
            return cur.time
        }
        
        for i in 0..<4 {
            var x = cur.x + dx[i]
            var y = cur.y + dy[i]
            if isValidPoint(x, y) && !visit[y][x] {
                visit[y][x] = true
                queue.push(Dot(x, y, cur.time + 1))
            }
        }
    }
    return -1
}

func isValidPoint(_ x: Int, _ y: Int) -> Bool {
    return 0 <= x && x < map[0].count && 0 <= y && y < map.count && map[y][x] != "X"
}

struct Dot {
    let x: Int
    let y: Int
    let time: Int
    
    init(_ x: Int, _ y: Int, _ time: Int = 0) {
        self.x = x
        self.y = y
        self.time = time
    }
}

struct Queue<T> {
    private var array: [T] = []
    private var head: Int = 0
    
    var count: Int {
        array.count - head
    }
    
    var isEmpty: Bool {
        count <= 0
    }
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func pop() -> T {
        let item = array[head]
        head += 1
        return item
    }
}
