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
    
    static let TimeTable: [[ClassRow]] = [
    // Monday
    [
    ClassRow(classNumber: "1", className: "Monday", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "7", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "8", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "08:55 - 09:30")
    ],
    // Tuesday
    [
    ClassRow(classNumber: "1", className: "Tuesday", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "2", className: "10.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "4", className: "10.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "5", className: "10.A. 1.cs", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "6", className: "10.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "7", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "8", className: "10.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "9", className: "10.A. 1.cs", classTime: "08:55 - 09:30")
    ],
    // Wednesday
    [
    ClassRow(classNumber: "1", className: "Wednesday", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "7", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "8", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "08:55 - 09:30")
    ],
    // Thursday
    [
    ClassRow(classNumber: "1", className: "Thurstay", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "7", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "8", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "08:55 - 09:30")
    ],
    // Friday
    [
    ClassRow(classNumber: "1", className: "Friday", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "08:00 - 08:45"),
    ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "7", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
    ClassRow(classNumber: "8", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
    ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "08:55 - 09:30")
    ]
    ]
   
   
    
    static let TimeTableColors: [ColorScheme] = [
        ColorScheme(numberTextColor: .lightGray, numberBackgroundColor: .darkGray, nameTextColor: .lightGray, timeTextColor: .lightGray),
        ColorScheme(numberTextColor: .lightGray, numberBackgroundColor: .darkGray, nameTextColor: .lightGray, timeTextColor: .lightGray),
        ColorScheme(numberTextColor: .black, numberBackgroundColor: .green, nameTextColor: .white, timeTextColor: .green),
        ColorScheme(numberTextColor: .black, numberBackgroundColor: .cyan, nameTextColor: .cyan, timeTextColor: .green),
        ColorScheme(numberTextColor: .black, numberBackgroundColor: .cyan, nameTextColor: .cyan, timeTextColor: .green),
        ColorScheme(numberTextColor: .black, numberBackgroundColor: .cyan, nameTextColor: .cyan, timeTextColor: .green),
        ColorScheme(numberTextColor: .black, numberBackgroundColor: .white, nameTextColor: .black, timeTextColor: .lightGray),
        ColorScheme(numberTextColor: .black, numberBackgroundColor: .cyan, nameTextColor: .cyan, timeTextColor: .green),
        ColorScheme(numberTextColor: .black, numberBackgroundColor: .white, nameTextColor: .black, timeTextColor: .lightGray),
        ColorScheme(numberTextColor: .black, numberBackgroundColor: .cyan, nameTextColor: .cyan, timeTextColor: .green)
        ]
    
    struct ColorMatchKey {
        static let passed = "passed"
        static let actual = "actual"
        static let future = "future"
        static let empty = "empty"
    }
    
    static let ColorMatch: [String : ColorScheme] = [
        "passed" : ColorScheme(numberTextColor: .lightGray, numberBackgroundColor: .darkGray, nameTextColor: .lightGray, timeTextColor: .lightGray),
        "actual" : ColorScheme(numberTextColor: .black, numberBackgroundColor: .green, nameTextColor: .white, timeTextColor: .green),
        "future" : ColorScheme(numberTextColor: .black, numberBackgroundColor: .cyan, nameTextColor: .cyan, timeTextColor: .green),
        "empty" : ColorScheme(numberTextColor: .black, numberBackgroundColor: .white, nameTextColor: .black, timeTextColor: .lightGray)
    ]
        
}
