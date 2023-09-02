//
//  CustomCell.swift
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
        

       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
