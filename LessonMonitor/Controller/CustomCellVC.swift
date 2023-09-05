//
//  CustomCellVC.swift
//  LessonMonitor
//
//  Created by Laszlo Kovacs on 2023. 09. 01..
//

import UIKit

class CustomCellVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer: Timer?
    
    var dayOfWeekString: String = ""
    
    var timeTable = K.TimeTable
    
    var timeTableColors = K.TimeTableColors
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d. EEEE HH:mm"
        let timeString = dateFormatter.string(from: Date())
    
        timeLabel.text = timeString
        
        startTimer()
        
        tableView.dataSource = self

        tableView.register( UINib(nibName: K.cellNibName , bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    deinit {
        stopTimer()
    }
    
}

//MARK: - Timer
extension CustomCellVC {

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        
        timer = nil
    }
    
    @objc func updateTimer() {
       let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM d. EEEE HH:mm"
        let timeString = dateFormatter.string(from: Date())
        
        dateFormatter.dateFormat = "EE"
        dayOfWeekString = dateFormatter.string(from: Date())
        
        dateFormatter.dateFormat = "HH:mm"
        let hourMinute = dateFormatter.string(from: Date())
        // updateTimeTableColors()
        
        timeLabel.text = timeString
        
        tableView.reloadData()
    }
   
}

//MARK: - Table
extension CustomCellVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTable[0].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dayOfTimeTable = dayOfWeekNumber(from: dayOfWeekString)
        
        let rowOfTimeTable =  timeTable[dayOfTimeTable][indexPath.row]
        
        let rowColor = timeTableColors[indexPath.row]
        
        
       // let rowColor = K.ColorMatch[K.ColorMatchKey.actual]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! CustomCell
        
        cell.classNumber.text = rowOfTimeTable.classNumber
        cell.className.text = rowOfTimeTable.className
        cell.classTime.text = rowOfTimeTable.classTime
        
       // set color of cell
        
        cell.classNumber.backgroundColor = rowColor.numberBackgroundColor
        cell.classNumber.textColor = rowColor.numberTextColor
        
        cell.className.textColor = rowColor.nameTextColor
        
        cell.classTime.textColor = rowColor.timeTextColor
  
        return cell
    }
  
    func dayOfWeekNumber(from dayString: String) -> Int {
        switch dayString {
        
        case "Tue": return 2
        
        default: return 0
        }
    }
  
    
}


