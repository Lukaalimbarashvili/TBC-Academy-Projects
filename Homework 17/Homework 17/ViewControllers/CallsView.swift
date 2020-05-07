//
//  CallsView.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class CallsView: UIViewController {

    @IBOutlet weak var callsTableView: UITableView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        callsTableView.delegate = self
        callsTableView.dataSource = self
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        UDManager.markFirstTabBar()
    }

}

extension CallsView: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return callsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Calls_cell", for: indexPath) as! CallsTableViewCell
        
        cell.numberCell.text = callsArray[indexPath.row].number
        cell.countryCell.text = callsArray[indexPath.row].country
        cell.dateCell.text = callsArray[indexPath.row].date
        
        return cell
    }
    
    
    
}


extension CallsView: UITableViewDelegate {
    
}
