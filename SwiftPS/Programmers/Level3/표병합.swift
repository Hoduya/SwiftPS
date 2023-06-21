//
//  표병합.swift
//  SwiftPS
//
//  Created by HoJun on 2023/06/21.
//

import Foundation

func solution(_ commands:[String]) -> [String] {
    
    var result: [String] = []
    var map: [[Cell]] = [[]]
    
    (0..<51).forEach { _ in
        var row: [Cell] = []
        (0..<51).forEach { _ in
            let cell = Cell()
            row.append(cell)
        }
        map.append(row)
    }
    
    var mergeDic: [Int : [Point]] = [:]
    var _newID = 0
    var newID: Int {
        _newID += 1
        return _newID
    }
    
    class Cell {
        var value: String = ""
        var mergeID: Int = 0
    }

    struct Point: Equatable {
        var r: Int
        var c: Int
        
        init(r: String, c: String) {
            self.r = Int(r)!
            self.c = Int(c)!
        }
    }
    
    func update(value1: String, value2: String) {
        for i in 1..<map.count {
            for j in 1..<map[i].count {
                if map[i][j].value == value1 {
                    map[i][j].value = value2
                }
            }
        }
    }
    
    func update(point: Point, value: String) {
        let cell = map[point.r][point.c]
        cell.value = value
        if let merges = mergeDic[cell.mergeID] {
            for p in merges {
                map[p.r][p.c].value = value
            }
        }
    }
    
    func merge(point1: Point, point2: Point) {
        guard point1 != point2 else { return }
        
        let cell1 = map[point1.r][point1.c]
        let cell2 = map[point2.r][point2.c]
        
        let newValue = cell1.value.isEmpty ? cell2.value : cell1.value
        let newMergeID = newID
        
        mergeDic[newMergeID] = []
        mergeDic[newMergeID]?.append(point1)
        mergeDic[newMergeID]?.append(point2)
        
        if let merges = mergeDic[cell1.mergeID] {
            mergeDic[cell1.mergeID] = nil
            mergeDic[newMergeID]?.append(contentsOf: merges)
        }
        
        if let merges = mergeDic[cell2.mergeID] {
            mergeDic[cell2.mergeID] = nil
            mergeDic[newMergeID]?.append(contentsOf: merges)
        }
        
        if let newMerges = mergeDic[newMergeID] {
            for p in newMerges {
                map[p.r][p.c].value = newValue
                map[p.r][p.c].mergeID = newMergeID
            }
        }
    }
    
    func unmerge(point: Point) {
        let value = map[point.r][point.c].value
        let mergeID = map[point.r][point.c].mergeID
        
        if let merges = mergeDic[mergeID] {
            for p in merges {
                map[p.r][p.c].value = ""
                map[p.r][p.c].mergeID = 0
            }
        }
        map[point.r][point.c].value = value
    }
    
    func printing(point: Point) {
        let value = map[point.r][point.c].value
        result.append(value.isEmpty ? "EMPTY" : value)
    }
    
    for command in commands {

        let elements = command.components(separatedBy: " ")
        let action = elements[0]

        switch action {

            case "UPDATE":
                if elements.count == 3 {
                    update(value1: elements[1], value2: elements[2])
                }
                else {
                    let point = Point(r: elements[1], c: elements[2])
                    update(point: point, value: elements[3])
                }

            case "MERGE":
                let point1 = Point(r: elements[1], c: elements[2])
                let point2 = Point(r: elements[3], c: elements[4])
                merge(point1: point1, point2: point2)

            case "UNMERGE":
                let point = Point(r: elements[1], c: elements[2])
                unmerge(point: point)

            case "PRINT":
                let point = Point(r: elements[1], c: elements[2])
                printing(point: point)

            default:
                break
        }
    }
    
    return result
}

