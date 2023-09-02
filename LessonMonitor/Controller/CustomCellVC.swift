//
//  CustomCellVC.swift
//  LessonMonitor
//
//  Created by Laszlo Kovacs on 2023. 09. 01..
//

import UIKit

class CustomCellVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var timeTable = K.TimeTable

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

        tableView.register( UINib(nibName: K.cellNibName , bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        // Do any additional setup after loading the view.
    }


}

extension CustomCellVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowOfTimeTable =  timeTable[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! CustomCell
        
        cell.classNumber.text = rowOfTimeTable.classNumber
        cell.className.text = rowOfTimeTable.className
        cell.classTime.text = rowOfTimeTable.classTime
        
        return cell
        
    }
    

    
}
