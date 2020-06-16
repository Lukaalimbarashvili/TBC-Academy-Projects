//
//  ViewController.swift
//  Homework 41
//
//  Created by Luka Alimbarashvili on 6/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Home_VC: UIViewController {

    
    let AllCoffe = ["Espresso","Cappuccino","macciato","Mocha","latte"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
             self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func onLocation(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Location_SB", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "location")
       
        navigationController?.pushViewController(nextViewController, animated: true)
    
    }
    
}

extension Home_VC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllCoffe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath) as! TableViewCell
        
        cell.coffeImage.image = UIImage(named: AllCoffe[indexPath.row])
        cell.coffeeName.text = AllCoffe[indexPath.row]
        
        return cell
    }
    
    
}
