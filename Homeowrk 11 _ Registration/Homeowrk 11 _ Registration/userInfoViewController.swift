//
//  userInfoViewController.swift
//  Homeowrk 11 _ Registration
//
//  Created by Luka Alimbarashvili on 4/29/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class userInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  
    
    var finalUsers = [UserInfo]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.numberOfLines = 0;

        for item in finalUsers {
            cell.textLabel?.text = "Name : \(item.name)\nSurname : \(item.surname)\nEmail : \(item.email)\nGender : \(item.gender)\nChild/Adult : \(item.ageDetector)"

        }
        
        return cell
         
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      

    }
    



}
