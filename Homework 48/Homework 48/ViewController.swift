//
//  ViewController.swift
//  Homework 48
//
//  Created by Luka Alimbarashvili on 6/24/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var selectedIndex = -1
    var isCollapced = false
    
    var dissapearLabel = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.estimatedRowHeight = 350
//        tableView.rowHeight = UITableView.automaticDimension
    }
 

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath) as!TableViewCell
        cell.tempMovie = allMovie[indexPath.row]
        cell.DissapearTapForDetailLabel = dissapearLabel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapced == true {
            dissapearLabel = true
            return tableView.rowHeight
        } else {
            dissapearLabel = false
            return 510
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if selectedIndex == indexPath.row {
            isCollapced = isCollapced ? false : true
        } else {
            self.isCollapced = true
        }
        
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at:[indexPath], with: .automatic)

      
        let indexPath = NSIndexPath(row: indexPath.row, section: 0)
        tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
        
        
    }
    
}
