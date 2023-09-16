//
//  HourMinTime.swift
//  LessonMonitor
//
//  Created by Laszlo Kovacs on 2023. 09. 16..
//

import Foundation

struct HourMinTime {
    var hour: Int = 0
    
    var minute: Int = 0
    
    var totalMinutes: Int {
        hour * 60 + minute
    }
}
