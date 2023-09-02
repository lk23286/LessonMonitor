//
//  customCell.swift
//  LessonMonitor
//
//  Created by Laszlo Kovacs on 2023. 09. 01..
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var classNumber: UILabel!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var classTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        classNumber.text = "4"
        className.text = "8.A 1.cs"
        classTime.text = "10:45 - 11:30"
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
