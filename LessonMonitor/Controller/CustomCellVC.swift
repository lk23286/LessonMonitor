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
    
    //var dayString: String = ""
    var workingDayinNumber: Int = 0
    
    var timeTable = K.timeTable
    
    var colorTable = K.colorTableExample
    
    var remainingTime = RemainingTime()
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.register( UINib(nibName: K.cellNibName , bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        // initiate time on the bottom label
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d. EEEE HH:mm"
        let timeString = dateFormatter.string(from: Date())
        
        timeLabel.text = timeString
        
        // initiate working day in number for the table
        
        dateFormatter.dateFormat = "EEEE"
        let dayString = dateFormatter.string(from: Date())
        workingDayinNumber = makeDayNumber(from: dayString)
        
        startTimer()
        
        remainingLabel.text = remainingTime.text
        remainingLabel.textColor = remainingTime.TextColor
        remainingLabel.backgroundColor = remainingTime.BkgColor
        
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
        let dateFormatter = DateFormatter()
        
        // Display the day and time at the bottom label
        dateFormatter.dateFormat = "MMM d. EEEE HH:mm:ss"
        let timeString = dateFormatter.string(from: Date())
        
        timeLabel.text = timeString
        
        // Set the day
        dateFormatter.dateFormat = "EEEE"
        let dayString = dateFormatter.string(from: Date())
        workingDayinNumber = makeDayNumber(from: dayString)
        
        // Refresh the ColorTable
        //   dateFormatter.dateFormat = "HH:mm"
        
        tableView.reloadData()
    }
    
}

//MARK: - Table

extension CustomCellVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTable[0].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let dayOfWeek = makeDayNumber(from: dayString)
        
        let timeTableIndex = indexPath.row
        
        let timeTableRow =  timeTable[workingDayinNumber][timeTableIndex]
        
        // let rowColor = colorTable[indexPath.row]
        
        //let rowColor = K.ColorMatch[K.ColorMatchKey.actual] ?? ColorScheme(numberTextColor: .black, numberBackgroundColor: .blue, nameTextColor: .white, timeTextColor: .brown)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! CustomCell
        
        cell.classNumber.text = timeTableRow.classNumber
        cell.className.text = timeTableRow.className
        cell.classTime.text = timeTableRow.classTime
        
        // set color of cell
        
        let rowStatus = rowStatusIdentifier(at: timeTableRow)
               
        if let rowColor = K.ColorMatch[rowStatus] {
            cell.classNumber.backgroundColor = rowColor.numberBackgroundColor
            cell.classNumber.textColor = rowColor.numberTextColor
            
            cell.className.textColor = rowColor.nameTextColor
            
            cell.classTime.textColor = rowColor.timeTextColor
        }
        
        remainingLabel.text = remainingTime.text
        remainingLabel.backgroundColor = remainingTime.BkgColor
        remainingLabel.textColor = remainingTime.TextColor
        
        
        
        return cell
    }
}

//MARK: - Utilities

extension CustomCellVC {
    
    func makeDayNumber(from dayString: String) -> Int {
        
        print("dayString \(dayString)")
        
        switch dayString {
        case "Monday": return 1
        case "Tuesday": return 2
        case "Wednesday": return 3
        case "Thursday": return 4
        case "Friday": return 5
        default: return 0
        }
    }
    
    func rowStatusIdentifier(at row: ClassRow) ->  String {
        
        var status = ""
        
        let startString = String(row.classTime.prefix(5))
        
        let endString = String(row.classTime.suffix(5))
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        
        
        if let startDate = dateFormatter.date(from: startString), let endDate = dateFormatter.date(from: endString)  {
            
            // correct the now to have a date part identitacal to the startDate and stopDate (2000.01.01...)
            
            let rawNowString = dateFormatter.string(from: Date())
            let now = dateFormatter.date(from: rawNowString) ?? Date()
            
            
// print("rowFunc: now: \(now) start: \(startDate), end: \(endDate) ")
            
            if startDate <= now {
                if now < endDate {
                    status =  K.RowStatus.actual
                    //RemainingMinute = subtractTwoTimes(endDate - now) -> Int
                    remainingTime.counter =  subtractsTwoTimes(endDate, minus: now)
                    
                    
                    switch remainingTime.counter {
                    case let x where x > 10 :
                        remainingTime.BkgColor = .green
                        remainingTime.TextColor = .black
                        remainingTime.text = String(remainingTime.counter)
                        
                    case 6...10:
                        remainingTime.BkgColor = .orange
                        remainingTime.TextColor = .black
                        remainingTime.text = String(remainingTime.counter)
                        if remainingTime.counter == 10  {
                            playSound("A")
                        }
                    case 0...5:
                        remainingTime.BkgColor = .red
                        remainingTime.TextColor = .black
                        remainingTime.text = String(remainingTime.counter)
                        if remainingTime.counter == 5 {
                            playSound("B")
                        }
                        if remainingTime.counter == 1 {
                            playSound("C")
                        }
                    default:
                        remainingTime.BkgColor = .white
                        remainingTime.TextColor = .black
                        remainingTime.text = String(remainingTime.counter)
                        
                    }
                    
                } else {
                    status = K.RowStatus.passed
//                    remainingTimeBackgroundColor = .white
//                    remainingTimeTextColor = .black
//                    remainingTimeLabel = "BREAK"
                }
            } else {
                status = K.RowStatus.future
//                remainingTimeBackgroundColor = .white
//                remainingTimeTextColor = .black
//                remainingTimeLabel = "BREAK"
            }
        } else {
            status = K.RowStatus.empty
//            remainingTimeBackgroundColor = .white
//            remainingTimeTextColor = .black
//            remainingTimeLabel = "BREAK"
        }
     
//print(" rowFunc: row \(row.classTime) startString: \(startString) endString: \(endString) status \(status) minutes: \(RemainingClassMinutes) ")
             
        return status
        
    }
    
    func subtractsTwoTimes(_ timeA: Date, minus timeB: Date) -> Int {
       
        let timeDifference = timeA.timeIntervalSince(timeB)
        let minutes = Int((timeDifference.truncatingRemainder(dividingBy: 3600)) / 60)
        
        
        return minutes
    }
    
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

