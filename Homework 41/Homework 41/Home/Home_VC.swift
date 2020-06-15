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
        navigationController?.setNavigationBarHidden(true, animated: true)
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

extension Home_VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "details_id") as! Details_VC
        
        VC.tempImage = AllCoffe[indexPath.row]
        VC.tempName = AllCoffe[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
    }
}


