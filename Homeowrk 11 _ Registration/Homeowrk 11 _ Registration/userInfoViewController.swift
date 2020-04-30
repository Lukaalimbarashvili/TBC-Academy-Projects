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
        let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! CustomTableViewCell
        let info = finalUsers[indexPath.row]

        cell.nameLabel.text = "Name : \(info.name)"
        cell.surnameLabel.text = "Surname : \(info.surname)"
        cell.emailLabel.text = "Email : \(info.email)"
        cell.genderLabel.text = "Gender : \(info.gender)"
        cell.ageDetectorLabel.text = "Age : \(info.ageDetector)"
    
        
        return cell
         
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


    



}
