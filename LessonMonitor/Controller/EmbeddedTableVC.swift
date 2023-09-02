//
//  EmbeddedTableVC.swift
//  LessonMonitor
//
//  Created by Laszlo Kovacs on 2023. 09. 01..
//

import UIKit

class EmbeddedTableVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in 1...9 {
          
            tableData.append(number)
        }
        
        tableView.dataSource = self
      //  tableView.delegate = self
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EmbeddedTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmbeddedTVCell", for: indexPath)
        
        cell.textLabel?.text = String( tableData[indexPath.row] )
        
        return cell
        
    }

}

