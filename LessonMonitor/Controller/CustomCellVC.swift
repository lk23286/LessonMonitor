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
        
        // Refresh up label
        
        let label = getUpLabel()
        
        remainingLabel.text = label.text
        remainingLabel.backgroundColor = label.bkgColor
        remainingLabel.textColor = label.textColor
        
        // Refresh bottom label ( date )
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d. EEEE HH:mm:ss"
        let timeString = dateFormatter.string(from: Date())
        timeLabel.text = timeString
        
        
        
        
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
    
    // 2
    func getStartEndTimeFromDailyTimeTable( atRow rowNumber: Int ) -> StartEndTime? {
        
        var startEndTime = StartEndTime(start: "", end: "")
        
        var startEndTimeOptional: StartEndTime?
        // Select the row text
        
        let rowText =  timeTable[getWeekNumberForToday()][rowNumber]
        
        // cut the start time and end time of the class from ClassTime field. Example "12:00 - 12:45" -> "12:00" and "12:45"
        
        startEndTime.start = String(rowText.classTime.prefix(5))
        startEndTime.end = String(rowText.classTime.suffix(5))
        
        if startEndTime.start.isEmpty || startEndTime.end.isEmpty {
             startEndTimeOptional = nil
        } else {
            startEndTimeOptional = startEndTime
        }
        
print("classTime.start: \(startEndTime.start)")
print("rowText: \(rowText.classTime)")
print(" prefix: \(String(rowText.classTime.prefix(5)))")
        
        return startEndTimeOptional
        
    }
    // 3. timeDiffCalculatorFromNow
    func HowManyMinutesWeAreFromThisTime( timeHHMM: String ) -> Int {
        
        var classTime: Int = 0
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let nowHHMM = dateFormatter.string(from: Date())
        
        if let time = dateFormatter.date(from: timeHHMM), let now = dateFormatter.date(from: nowHHMM) {
            print("time: \(time)")
            print("now: \(now)")
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: time, to: now)
            let hour = components.hour ?? 0
            let minute = components.minute ?? 0
            classTime = hour * 60 + minute
        }
        return classTime
    }
    
    
    // 4. Calculate the Colors of the row
    func getDailyTimeTableColor(at rowNumber: Int) ->  ColorScheme {
        
        var status = K.RowStatus.empty
        
        if let timeString = getStartEndTimeFromDailyTimeTable(atRow: rowNumber) {
            let timeDiffFromStart = HowManyMinutesWeAreFromThisTime(timeHHMM: timeString.start)
            let timeDiffFromEnd = HowManyMinutesWeAreFromThisTime(timeHHMM: timeString.end)
            
            if timeDiffFromStart > -1 && timeDiffFromEnd < 0 {
                status = K.RowStatus.actual
            }
            
            if timeDiffFromStart > 0 && timeDiffFromEnd > -1 {
                status = K.RowStatus.passed
            }
            
            if timeDiffFromStart < 0  {
                status = K.RowStatus.future
            }
        } else {
            status = K.RowStatus.empty
        }
        
        let rowColor = K.ColorMatch[status]!
        
        return rowColor
        
    }
  
    
    // getRemainingLabel() -> Label
    func getUpLabel() -> Label {
        
        var label = Label()
        
        if let remainingClassTime = calculateRemainingClassTime() {
            print("..remainingClassTime: \(remainingClassTime)")
            if remainingClassTime > 10 {
                label.counter = remainingClassTime
                label.bkgColor = .green
                label.textColor = .black
            }
            if remainingClassTime <= 10 && remainingClassTime > 5 {
                label.counter = remainingClassTime
                label.bkgColor = .orange
                label.textColor = .black
            }
            if remainingClassTime <= 5 && remainingClassTime > 0 {
                label.counter = remainingClassTime
                label.bkgColor = .red
                label.textColor = .white
            }
        } else {
            label.bkgColor = .white
            label.textColor = .black
            label.counter = calculateRemainingBreakTime() ?? 0
            
            print("label.text: \(label.text)")
            
        }
        
       
        print("..label.counter: \(label.counter)")
        print("..label.text: \(label.text)")
        
        return label
    }
    
    
    func calculateRemainingClassTime() -> Int? {
        
        for rowNumber in 0...8 {
            if let timeString = getStartEndTimeFromDailyTimeTable(atRow: rowNumber) {
                
                let timeDiffFromStart = HowManyMinutesWeAreFromThisTime(timeHHMM: timeString.start)
                let timeDiffFromEnd = HowManyMinutesWeAreFromThisTime(timeHHMM: timeString.end)
                
                if timeDiffFromStart > -1  && timeDiffFromEnd < 0 {
                    
                    return timeDiffFromEnd * -1
                }
            }
        }
        return nil
    }
    
    func calculateRemainingBreakTime() -> Int? {
        
        
        
        for rowNumber in 0...8 {
            if let timeString = getStartEndTimeFromDailyTimeTable(atRow: rowNumber) {
                
                let timeDiffFromStart = HowManyMinutesWeAreFromThisTime(timeHHMM: timeString.start)
                let timeDiffFromEnd = HowManyMinutesWeAreFromThisTime(timeHHMM: timeString.end)
                
                print("rowNumber: \(rowNumber) diffFromStart: \(timeDiffFromStart) diffFromEnd: \(timeDiffFromEnd)")
                
                if timeDiffFromStart <= -1 {
                    
                   return timeDiffFromStart * -1
                }
            }
        }
        return nil
    }
    
    
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
    
    
}

