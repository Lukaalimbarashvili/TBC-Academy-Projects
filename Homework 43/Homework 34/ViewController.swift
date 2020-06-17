//
//  ViewController.swift
//  Homework 34
//
//  Created by Luka Alimbarashvili on 6/17/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    let lanes = ["Top","Jungle","Mid","Bottom","Suppot"]
    
    var top     = ["tryndamere", "ornn", "gangplank"]
    var jungle  = ["elise", "nidalee", "reksai"]
    var mid     = ["yasuo", "syndra", "orianna"]
    var bottom  = ["vayne", "lucian", "missfortune"]
    var support = ["bard", "leona", "alistar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 250
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lanes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL_ID", for: indexPath) as! TableViewCell
        
        let allLane = [top,jungle,mid,bottom,support]
    
        cell.Lane.text = lanes[indexPath.row]
        cell.tempChamps = allLane[indexPath.row]
        
        
        cell.didSelectItemAction = { [weak self] indexPath, String in
        let detailVC = self?.storyboard?.instantiateViewController(identifier: "Details") as! DetailsVC
        detailVC.tempChamp = String
        self?.navigationController?.pushViewController(detailVC, animated: true) }
        
        return cell 
    }
    
    
}
