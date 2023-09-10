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
    
    static let timeTable: [[ClassRow]] = [
        // No working day
        [
            ClassRow(classNumber: "1", className: "No Working Day", classTime: "08:00 - 08:45"),
            ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
            ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
            ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
            ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "08:00 - 08:45"),
            ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "20:00 - 21:50"),
            ClassRow(classNumber: "7", className: "10.A. 1.cs", classTime: "10:15 - 08:45"),
            ClassRow(classNumber: "8", className: "11.A. 1.cs", classTime: "08:55 - 09:30"),
            ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "08:55 - 09:30")
        ],
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
            ClassRow(classNumber: "1", className: "Thursday", classTime: "08:00 - 08:45"),
            ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
            ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "10:15 - 10:45"),
            ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: ""),
            ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "11:50 - 12:35"),
            ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "12:45 - 13:15"),
            ClassRow(classNumber: "7", className: "10.A. 1.cs", classTime: "14:10 - 14:55"),
            ClassRow(classNumber: "8", className: "11.A. 1.cs", classTime: "16:05 - 16:50"),
            ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "17:00 - 17:45")
        ],
        // Friday
        [
            ClassRow(classNumber: "1", className: "Friday", classTime: "08:00 - 08:45"),
            ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
            ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "09:40 - 10:25"),
            ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "10:35 - 11:20"),
            ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "17:00 - 17:32"),
            ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "18:55 - 19:40"),
            ClassRow(classNumber: "7", className: "", classTime: ""),
            ClassRow(classNumber: "8", className: "", classTime: ""),
            ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "21:15 - 22:00")
        ],
        // Saturday
        [
            ClassRow(classNumber: "1", className: "Friday", classTime: "08:00 - 08:45"),
            ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
            ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "09:40 - 10:25"),
            ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "10:35 - 11:20"),
            ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "18:00 - 18:45"),
            ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "18:55 - 19:40"),
            ClassRow(classNumber: "7", className: "", classTime: ""),
            ClassRow(classNumber: "8", className: "", classTime: ""),
            ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "21:15 - 22:00")
        ],
        [
            ClassRow(classNumber: "1", className: "Sunday", classTime: "14:00 - 14:45"),
            ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "14:55 - 15:30"),
            ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "15:40 - 16:25"),
            ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "16:35 - 17:20"),
            ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "17:30 - 18:15"),
            ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "18:25 - 18:56"),
            ClassRow(classNumber: "7", className: "10.A 1.cs", classTime: "20:10 - 20:55"),
            ClassRow(classNumber: "8", className: "", classTime: ""),
            ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "21:15 - 22:00")
        ]
        
    ]
    
    
    static let colorTableExample: [ColorScheme] = [
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
    
    struct RowStatus {
        static let passed = "passed"
        static let actual = "actual"
        static let future = "future"
        static let empty = "empty"
    }
    
    static let ColorMatch: [String : ColorScheme] = [
        "passed" : ColorScheme(numberTextColor: .lightGray, numberBackgroundColor: .darkGray, nameTextColor: .lightGray, timeTextColor: .lightGray),
        "actual" : ColorScheme(numberTextColor: .black, numberBackgroundColor: .green, nameTextColor: .white, timeTextColor: .white),
        "future" : ColorScheme(numberTextColor: .black, numberBackgroundColor: .cyan, nameTextColor: .cyan, timeTextColor: .green),
        "empty" : ColorScheme(numberTextColor: .black, numberBackgroundColor: .white, nameTextColor: .black, timeTextColor: .lightGray)
    ]
    
    static let RemainingTimeDefault = Label(text: "", TextColor: .black, BkgColor: .black)
    
}
