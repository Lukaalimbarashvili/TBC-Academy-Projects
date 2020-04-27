//
//  userInfoViewController.swift
//  Homework9.1
//
//  Created by Luka Alimbarashvili on 4/27/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class userInfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var finalName = ""
    
    @IBOutlet weak var surnameLabel: UILabel!
    var finalSurname = ""
    
    @IBOutlet weak var emailLabel: UILabel!
    var finalEmail = ""
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    var finalPhoneNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name : \(finalName)"
        surnameLabel.text = "Surname : \(finalSurname)"
        emailLabel.text = "Email : \(finalEmail)"
        phoneNumberLabel.text = "Phone Number : \(finalPhoneNumber)"

        // Do any additional setup after loading the view.
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
