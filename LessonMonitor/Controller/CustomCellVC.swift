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
    
    //var dayString: String = ""
    var workingDayinNumber: Int = 0
    
    var timeTable = K.timeTable
    
    var colorTable = K.colorTableExample
    

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
        
        print("rowStatus: \(rowStatus) timeTableIndex: \(timeTableIndex) timeTableRow: \(timeTableRow)")
        
        
        if let rowColor = K.ColorMatch[rowStatus] {
            cell.classNumber.backgroundColor = rowColor.numberBackgroundColor
            cell.classNumber.textColor = rowColor.numberTextColor
            
            cell.className.textColor = rowColor.nameTextColor
            
            cell.classTime.textColor = rowColor.timeTextColor
        }

  
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
        // check row

            var status = ""
            
            let now = Date()
        
            
            let startString = String(row.classTime.prefix(5))
            
            let endString = String(row.classTime.suffix(5))
      
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "HH:mm"
            
            if let startDate = dateFormatter.date(from: startString), let endDate = dateFormatter.date(from: endString)  {
               
                // correct the now to have a date part identitacal to the startDate and stopDate (2000.01.01...)
                let rawNow = Data()
                let rawNowString = dateFormatter.string(from: Date())
                let now = dateFormatter.date(from: rawNowString) ?? Date()
                
                
    print("rowFunc: now: \(now) start: \(startDate), end: \(endDate) ")
                
                
                if startDate <= now {
                    if now <= endDate {
                        status =  K.RowStatus.actual
                    } else {
                        status = K.RowStatus.future
                    }
                } else {
                    status = K.RowStatus.passed
                }
            } else {
                status = K.RowStatus.empty
            }
        
        
        print(" rowFunc: row \(row.classTime) startString: \(startString) endString: \(endString) status \(status) ")
         
        
        return status
          
    }
    
}

