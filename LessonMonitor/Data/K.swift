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
            ClassRow(classNumber: "2", className: " ", classTime: "08:55 - 09:40"),
            ClassRow(classNumber: "3", className: " ", classTime: "09:50 - 10:35"),
            ClassRow(classNumber: "4", className: " ", classTime: "10:45 - 11:30"),
            ClassRow(classNumber: "5", className: " ", classTime: "11:40 - 12:25"),
            ClassRow(classNumber: "6", className: " ", classTime: "12:45 - 13:30"),
            ClassRow(classNumber: "7", className: " ", classTime: "13:35 - 14:30"),
            ClassRow(classNumber: "8", className: " ", classTime: "14:40 - 15:25"),
            ClassRow(classNumber: "9", className: " ", classTime: "16:00 - 16:45")
        ],
        // Monday
        [
            ClassRow(classNumber: "1", className: "", classTime: ""),
            ClassRow(classNumber: "2", className: "8.A. 1.Csoport", classTime: "08:55 - 09:40"),
            ClassRow(classNumber: "3", className: "H3", classTime: ""),
            ClassRow(classNumber: "4", className: "11.B. 2.Csoport", classTime: "10:45 - 11:30"),
            ClassRow(classNumber: "5", className: "11.C 2.Csoport", classTime: "11:40 - 12:25"),
            ClassRow(classNumber: "6", className: "11.A 2.Csoport", classTime: "12:45 - 13:30"),
            ClassRow(classNumber: "7", className: "", classTime: ""),
            ClassRow(classNumber: "8", className: "10.B. 2.Csoport", classTime: "14:55 - 15:25"),
            ClassRow(classNumber: "9", className: "", classTime: "")
        ],
        // Tuesday
        [
            ClassRow(classNumber: "1", className: "", classTime: ""),
            ClassRow(classNumber: "2", className: "6.B mat2", classTime: "08:55 - 09:40"),
            ClassRow(classNumber: "3", className: "6.A. 2. Csoport", classTime: "09:50 - 10:35"),
            ClassRow(classNumber: "4", className: "7.A. 1.Csoport", classTime: "10:45 - 11:30"),
            ClassRow(classNumber: "5", className: "7.B. mat2", classTime: "11:40 - 12:25"),
            ClassRow(classNumber: "6", className: "10.A 2.Csoport", classTime: "12:45 - 13:30"),
            ClassRow(classNumber: "7", className: "test 1 ", classTime: "17:40 - 18:25"),
            ClassRow(classNumber: "8", className: "test 2", classTime: "18:35 - 19:20"),
            ClassRow(classNumber: "9", className: " test 3", classTime: "19:30 - 20:15")
        ],
        // Wednesday
        [
            ClassRow(classNumber: "1", className: "", classTime: ""),
            ClassRow(classNumber: "2", className: " ", classTime: ""),
            ClassRow(classNumber: "3", className: "5.B mat1", classTime: "09:50 - 10:35"),
            ClassRow(classNumber: "4", className: "7.A 2.Csoport", classTime: "10:45 - 11:30"),
            ClassRow(classNumber: "5", className: "5.B mat2", classTime: "11:40 - 12:25"),
            ClassRow(classNumber: "6", className: "7.B mat1", classTime: "12:55 - 13:40"),
            ClassRow(classNumber: "7", className: "6.A 1. Csoport", classTime: "13:50 - 14:35"),
            ClassRow(classNumber: "8", className: "14:35 Ebed", classTime: ""),
            ClassRow(classNumber: "9", className: " ", classTime: "")
        ],
        // Thursday
        [
            ClassRow(classNumber: "1", className: "6.B mat1", classTime: "08:00 - 08:45"),
            ClassRow(classNumber: "2", className: "5.A 1. Csoport", classTime: "08:55 - 09:40"),
            ClassRow(classNumber: "3", className: "9.B 1. Csoport", classTime: "09:50 - 10:35"),
            ClassRow(classNumber: "4", className: "11.B 2. Csoport", classTime: "10:45 - 11:30"),
            ClassRow(classNumber: "5", className: "11.C 2. Csoport", classTime: "11:40 - 12:25"),
            ClassRow(classNumber: "6", className: " ", classTime: ""),
            ClassRow(classNumber: "7", className: " ", classTime: ""),
            ClassRow(classNumber: "8", className: " ", classTime: ""),
            ClassRow(classNumber: "9", className: " ", classTime: "")
        ],
        // Friday
        [
            ClassRow(classNumber: "1", className: "5.A 2. Csoport", classTime: "08:00 - 08:45"),
            ClassRow(classNumber: "2", className: "H2 Udvar", classTime: ""),
            ClassRow(classNumber: "3", className: "11.A 2. Csoport", classTime: "09:50 - 10:35"),
            ClassRow(classNumber: "4", className: "H1 Udvar", classTime: "10:45 - 11:30"),
            ClassRow(classNumber: "5", className: "8.B mat1", classTime: "11:40 - 12:25"),
            ClassRow(classNumber: "6", className: "9.B 1. Csoport", classTime: "12:45 - 13:30"),
            ClassRow(classNumber: "7", className: " ", classTime: ""),
            ClassRow(classNumber: "8", className: " ", classTime: ""),
            ClassRow(classNumber: "9", className: " ", classTime: "")
        ],
        // Saturday
        [
            ClassRow(classNumber: "1", className: "Saturday", classTime: "08:00 - 08:45"),
            ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "08:55 - 09:30"),
            ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "09:40 - 10:25"),
            ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "10:35 - 11:20"),
            ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "12:00 - 12:45"),
            ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "12:50 - 13:30"),
            ClassRow(classNumber: "7", className: "", classTime: ""),
            ClassRow(classNumber: "8", className: "", classTime: ""),
            ClassRow(classNumber: "9", className: "11.A. 1.cs", classTime: "21:15 - 22:00")
        ],
        // Sunday
        [
            ClassRow(classNumber: "1", className: "Sunday", classTime: "14:00 - 14:45"),
            ClassRow(classNumber: "2", className: "9.A. 1.cs", classTime: "14:55 - 15:30"),
            ClassRow(classNumber: "3", className: "10.A. 1.cs", classTime: "15:40 - 16:25"),
            ClassRow(classNumber: "4", className: "11.A. 1.cs", classTime: "16:35 - 17:20"),
            ClassRow(classNumber: "5", className: "8.A. 1.cs", classTime: "17:30 - 18:15"),
            ClassRow(classNumber: "6", className: "9.A. 1.cs", classTime: "19:00 - 19:56"),
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
    
    static let RemainingTimeDefault = Label(textColor: .black, bkgColor: .black)
    
}
