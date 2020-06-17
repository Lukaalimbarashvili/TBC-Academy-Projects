//
//  DetailsVC.swift
//  Homework 34
//
//  Created by Luka Alimbarashvili on 6/17/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var champImage: UIImageView!
    @IBOutlet weak var champName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var tempChamp: String?
    
    var ability = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.champImage.image = UIImage(named: self.tempChamp!)
        self.champName.text = self.tempChamp
    }
    

    

}

extension DetailsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DETAILS_CELL_ID", for: indexPath) as! DetailsCell
        cell.tempAbility = "Ability \(ability)"
        ability += 1
        return cell
    }
    
    
}

