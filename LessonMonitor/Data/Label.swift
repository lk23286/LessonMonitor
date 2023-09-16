//
//  RemainingTime.swift
//  LessonMonitor
//
//  Created by Laszlo Kovacs on 2023. 09. 08..
//

import Foundation
import UIKit

struct Label {
    
    var counter: Int = 0
    
    var text: String {
        
        get {
             var resultString = ""
             
            if counter != 0 {
                var min = 0
                var hour = 0
                var day = 0
                    
                    day = Int(counter / (24*60))
                    min = counter % (24*60)
                    hour = Int(min / 60)
                    min = min % 60
                    
                    if day == 0 {
                        if hour == 0 {
                            resultString = "\(min)"
                        } else {
                            resultString = "\(hour):\(min)"
                        }
                    } else {
                        resultString = "\(day) day \(hour) hours \(min) min"
                    }
            } else {
                resultString = "Break"
            }
            
             
            
             return resultString
        }
        set {
            
        }
 
    }
    
    var textColor: UIColor = .white
    
    var bkgColor: UIColor = .black
    
}

