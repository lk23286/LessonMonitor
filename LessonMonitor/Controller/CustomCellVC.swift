//
//  CustomCellVC.swift
//  LessonMonitor
//
//  Created by Laszlo Kovacs on 2023. 09. 01..
//

import UIKit

import AVFAudio

class CustomCellVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var remainingLabel: UILabel!
    
    var timer: Timer?
    
    var timeTable = K.timeTable
    
    // var colorTable = K.colorTableExample
    
    var audioPlayer: AVAudioPlayer?
    
//    var storedActualClassEndTime: Date?
//    var isActualClass: Bool = false
    
    
    // Set parameters before the screen appears
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.register( UINib(nibName: K.cellNibName , bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        // initiate bottom label ( date )
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d. EEEE HH:mm"
        let timeString = dateFormatter.string(from: Date())
        
        timeLabel.text = timeString
        
        startTimer()
        
        // initiate up label (remaining time)
        
        remainingLabel.text = ""
        remainingLabel.textColor = .black
        remainingLabel.backgroundColor = .white
        
    }
    
    deinit {
        stopTimer()
    }
    
    
}

//MARK: - Timer

extension CustomCellVC {
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        
        timer = nil
    }
    
    // Do the action when the time comes
    
    @objc func updateTimer() {
        
        // Refresh up label( remaining time )
        
        // getRemainingLabel() -> Label
        
        remainingLabel.text = getRemainingLabel().text
        remainingLabel.backgroundColor = getRemainingLabel().bkgColor
        remainingLabel.textColor = getRemainingLabel().textColor
        
        // Refresh bottom label ( date )
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d. EEEE HH:mm:ss"
        let timeString = dateFormatter.string(from: Date())
        timeLabel.text = timeString
        
        // Refresh up label
        
        
        // Refresh the time table
        tableView.reloadData()
    }
    
}

//MARK: - Table

extension CustomCellVC: UITableViewDataSource {
    
    // set the lenght of the Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTable[0].count
    }
    
    // Set the actual cell of the table
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // initiate row number
        
        let rowNumber = indexPath.row
        
        // Select time table for this day
        
        let dailyTimeTable = timeTable[getWeekNumberForToday()]
        
        // Select the row from the daily time table
        
        let timeTableRowText =  dailyTimeTable[rowNumber]
        
        // Calculate the colors for the row
        
        let timeTableRowColorScheme = getDailyTimeTableColor(at: rowNumber)
        
        // Define cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! CustomCell
        
        // Set the Text of the row
        
        cell.classNumber.text = timeTableRowText.classNumber
        cell.className.text = timeTableRowText.className
        cell.classTime.text = timeTableRowText.classTime
        
        print("timeTableRowText: \(timeTableRowText.className)")
        
        // Set the Color of the row
        
        cell.classNumber.backgroundColor = timeTableRowColorScheme.numberBackgroundColor
        cell.classNumber.textColor = timeTableRowColorScheme.numberTextColor
        
        cell.className.textColor = timeTableRowColorScheme.nameTextColor
        
        cell.classTime.textColor = timeTableRowColorScheme.timeTextColor
        
        return cell
    }
}

//MARK: - Utilities

extension CustomCellVC {
    
    // 1 Creates a today number of the week ( 1-7)
    func getWeekNumberForToday() -> Int {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        let dayString = dateFormatter.string(from: Date())
        
        switch dayString {
        case "Monday": return 1
        case "Tuesday": return 2
        case "Wednesday": return 3
        case "Thursday": return 4
        case "Friday": return 5
        case "Saturday": return 6
        case "Sunday": return 7
        default: return 0
        }
    }
    
    // 2 getTimeStringsFromDailyTimeTable( atRow: ) -> ClassTime
    func getTimeStringsFromDailyTimeTable( atRow rowNumber: Int ) -> ClassTime? {
        
        var classTime = ClassTime(start: "", end: "")
        
        var classTimeOptional: ClassTime?
        // Select the row text
        
        let rowText =  timeTable[getWeekNumberForToday()][rowNumber]
        
        // cut the start time and end time of the class from ClassTime field. Example "12:00 - 12:45" -> "12:00" and "12:45"
        
        classTime.start = String(rowText.classTime.prefix(5))
        classTime.end = String(rowText.classTime.suffix(5))
        
        if classTime.start.isEmpty || classTime.end.isEmpty {
             classTimeOptional = nil
        } else {
            classTimeOptional = classTime
        }
        
print("classTime.start: \(classTime.start)")
print("rowText: \(rowText.classTime)")
print(" prefix: \(String(rowText.classTime.prefix(5)))")
        
        return classTimeOptional
        
    }
    // 3. timeDiffCalculatorFromNow
    func timeDiffCalculatorFromNow( timeHHMM: String ) -> HourMinTime {
        
        var classTime = HourMinTime()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let nowHHMM = dateFormatter.string(from: Date())
        
        if let time = dateFormatter.date(from: timeHHMM), let now = dateFormatter.date(from: nowHHMM) {
            print("time: \(time)")
            print("now: \(now)")
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: time, to: now)
            classTime.hour = components.hour ?? 0
            classTime.minute = components.minute ?? 0
        }
        return classTime
    }
    
    
    // 4. Calculate the Colors of the row
    func getDailyTimeTableColor(at rowNumber: Int) ->  ColorScheme {
        
        var status = K.RowStatus.empty
        
        if let timeString = getTimeStringsFromDailyTimeTable(atRow: rowNumber) {
            let timeDiffFromStart = timeDiffCalculatorFromNow(timeHHMM: timeString.start)
            let timeDiffFromEnd = timeDiffCalculatorFromNow(timeHHMM: timeString.end)
            
            if timeDiffFromStart.totalMinutes > 0 && timeDiffFromEnd.totalMinutes < 0 {
                status = K.RowStatus.actual
            }
            
            if timeDiffFromStart.totalMinutes > 0 && timeDiffFromEnd.totalMinutes > 0 {
                status = K.RowStatus.passed
            }
            
            if timeDiffFromStart.totalMinutes < 0  {
                status = K.RowStatus.future
            }
        } else {
            status = K.RowStatus.empty
        }
        
        let rowColor = K.ColorMatch[status]!
        
        return rowColor
        
    }
  
        
//        // Select the row text
//
//        let rowText =  timeTable[getWeekNumberForToday()][rowNumber]
//
//        var status = ""
//
//        // cut the start time and end time of the class from ClassTime field. Example "12:00 - 12:45" -> "12:00" and "12:45"
//
//        let classStartTimeStr = getTimeStringsFromDailyTimeTable(atRow: rowNumber)
//        let classEndTimeStr = String(rowText.classTime.suffix(5))
//
//
//        // ClassStartTime and ClassEndTime  were created in Date format from String format to be compatible with the now()
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
//
//        // correct the now to have a date part identitacal to the startDate and stopDate (2000.01.01...)
//
//        let rawNowString = dateFormatter.string(from: Date())
//        let now = dateFormatter.date(from: rawNowString) ?? Date()
//
//        // startTimeFromDailyTimeTable( atRow: ) -> ClassTime
//
//
//        if let classStartTime = dateFormatter.date(from: classStartTimeStr), let classEndTime = dateFormatter.date(from: classEndTimeStr)  {
//
//            // Actual class
//
//            if classStartTime <= now {
//                if now < classEndTime {
//                    status =  K.RowStatus.actual
//
//                    calculateRemainingTime(classEndTime: classEndTime, now: now)
//                } else {
//                    status = K.RowStatus.passed
//                }
//            } else {
//                status = K.RowStatus.future
//            }
//
//        } else {
//            status = K.RowStatus.empty
//        }
//
//        let rowColor = K.ColorMatch[status]!
        
//        return rowColor
        
//    }
    
    // 4.Subtract two dates
    func subtractsTwoTimes(_ timeA: Date, minus timeB: Date) -> Int {
        
        let timeDifference = timeA.timeIntervalSince(timeB)
        let minutes = Int((timeDifference.truncatingRemainder(dividingBy: 3600)) / 60)
        
        return minutes
    }
    
    // 5. Play sounds
    func playSound(_ sound: String) {
        
        if let soundURL = Bundle.main.url(forResource: sound, withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            }
            catch {
                print("error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
    // 6. calculate Remaing  time for class and break if break it is negative
    
    
    // getRemainingLabel() -> Label
    func getRemainingLabel() -> Label {
        
        var label = Label()
        
        if let remainingClassTime = calculateRemainingClassTime() {
            if remainingClassTime.totalMinutes > 10 {
                label.counter = remainingClassTime.totalMinutes
                label.bkgColor = .green
                label.textColor = .black
            }
            if remainingClassTime.totalMinutes <= 10 && remainingClassTime.totalMinutes > 5 {
                label.counter = remainingClassTime.totalMinutes
                label.bkgColor = .orange
                label.textColor = .black
            }
            if remainingClassTime.totalMinutes <= 5 && remainingClassTime.totalMinutes > 0 {
                label.counter = remainingClassTime.totalMinutes
                label.bkgColor = .red
                label.textColor = .white
            }
        } else {
            label.text = "Break"
            label.bkgColor = .white
            label.textColor = .black
        }
        
        return label
    }
    
    
    func calculateRemainingClassTime() -> HourMinTime? {
        
        for rowNumber in 0...8 {
            if let timeString = getTimeStringsFromDailyTimeTable(atRow: rowNumber) {
                
                let timeDiffFromStart = timeDiffCalculatorFromNow(timeHHMM: timeString.start)
                let timeDiffFromEnd = timeDiffCalculatorFromNow(timeHHMM: timeString.end)
                
                if timeDiffFromStart.totalMinutes > 0 && timeDiffFromEnd.totalMinutes < 0 {
                    return timeDiffFromStart
                }
            }
        }
        return nil
    }
    
    
//    func calculateRemainingTime(classEndTime: Date, now: Date) {
//
//        let remainingTime =  subtractsTwoTimes(classEndTime, minus: now)
//
//        if remainingTime > 0 {
//
//            // in the class time ( Remaining class time )
//
//            label.counter = remainingTime
//
//            switch label.counter {
//            case let x where x > 10 :
//                label.BkgColor = .green
//                label.TextColor = .black
//                label.text = String(label.counter)
//
//            case 6...10:
//                label.BkgColor = .orange
//                label.TextColor = .black
//                label.text = String(label.counter)
//                if label.counter == 10  {
//                    playSound("A")
//                }
//            case 0...5:
//                label.BkgColor = .red
//                label.TextColor = .black
//                label.text = String(label.counter)
//                if label.counter == 5 {
//                    playSound("B")
//                }
//                if label.counter == 1 {
//                    playSound("C")
//                }
//            default:
//                label.BkgColor = .white
//                label.TextColor = .black
//                label.text = String(label.counter)
//            }
//        }
//    }
    

}

