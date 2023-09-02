//
//  K.swift
//  LessonMonitor
//
//  Created by Laszlo Kovacs on 2023. 09. 01..
//

import Foundation
struct K {
    static let cellIdentifier = "ReuseIdentifier"
    static let cellNibName = "CustomCell"
    
    static var TimeTable: [ClassRow] = [
    ClassRow(classNumber: "1", className: "8.A. 1.cs", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "7", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "8", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "08:55 - 09:30")
    
    ]
    
}