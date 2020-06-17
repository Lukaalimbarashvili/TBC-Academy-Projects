//
//  ViewController.swift
//  Homework 41
//
//  Created by Luka Alimbarashvili on 6/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import Localize

class Home_VC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let AllCoffe = ["Espresso","Cappuccino","macciato","Mocha","latte"]
    let coffeLanguages = [ "label.text.Espresso",
                           "label.text.Cappuccino",
                           "label.text.macciato",
                           "label.text.Mocha",
                           "label.text.latte"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func languageSwitch(_ sender: UISwitch) {
        
        if sender.isOn == true {
            let localize = Localize.shared
            localize.update(language: "en")

            tableView.reloadData()
        } else {
            let localize = Localize.shared
            localize.update(language: "ge")
            
            tableView.reloadData()
        }
    }

}

extension Home_VC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllCoffe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath) as! TableViewCell
        cell.coffe = AllCoffe[indexPath.row]
        cell.tempCoffeeName = coffeLanguages[indexPath.row]

        return cell
    }
    
}

extension Home_VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "details_id") as! Details_VC
        
        VC.tempCoffee = AllCoffe[indexPath.row]
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
}


