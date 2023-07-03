//
//  호텔대실.swift
//  SwiftPS
//
//  Created by HoJun on 2023/06/27.
//

import Foundation

func solution(_ book_time:[[String]]) -> Int {
    
    func timeToNumber(_ timeString: String, _ isEnd: Bool) -> Int{
        let times = timeString.split(separator: ":")
        var hour = Int(times[0])!
        var min = isEnd ? Int(times[1])! + 9 : Int(times[1])!
        if min >= 60 {
            min = min - 60
            hour += 1
        }
        var minString = min < 10 ? "0" + "\(min)" : "\(min)"
        
        return Int(String(hour) + minString)!
    }
    
    func needMoreRoom(_ time: Int, _ start: Int, _ end: Int) -> Bool {
        return start <= time && time <= end
    }
       
    
    let bookTimes: [[Int]] = book_time.map {
        let start = timeToNumber($0[0], false)
        let end = timeToNumber($0[1], true)
        return [start, end]
    }
        
    var startRoomCount = 0
    var endRoomCount = 0
    var maxCount = 0
    for i in 0..<bookTimes.count {
        let start = bookTimes[i][0]
        let end = bookTimes[i][1]
        startRoomCount = 1
        endRoomCount = 1
        for j in 0..<bookTimes.count {
            guard i != j else { continue }
            if needMoreRoom(start, bookTimes[j][0], bookTimes[j][1]) {
                startRoomCount += 1
            }
            if needMoreRoom(end, bookTimes[j][0], bookTimes[j][1]) {
                endRoomCount += 1
            }
        }
        maxCount = max(max(maxCount, startRoomCount), endRoomCount)
    }

    return maxCount
}
