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
    
    var timeTable = K.TimeTable
    var timeTableColors = K.TimeTableColors

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer?.invalidate()
        
        timer = nil
    }
    
    @objc func updateTimer() {
       let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm:ss"
        let timeString = dateFormatter.string(from: Date())
        
        timeLabel.text = timeString
    }
   
    
}

//MARK: - Table
extension CustomCellVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowOfTimeTable =  timeTable[indexPath.row]
        
        let rowColor = timeTableColors[indexPath.row]
        
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

    
}
