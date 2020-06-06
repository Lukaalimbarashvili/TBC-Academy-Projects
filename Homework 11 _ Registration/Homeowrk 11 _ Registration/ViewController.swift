//
//  ViewController.swift
//  Homeowrk 11 _ Registration
//
//  Created by Luka Alimbarashvili on 4/29/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var users = [UserInfo]()
    
    
    var gender = "Male"
    @IBAction func genderController(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            gender = "Male"
        } else {
            gender = "Female"
        }
    }
    
    var moreThan18 = "Child"
    @IBAction func ageDetector(_ sender: UISwitch) {
        if sender.isOn {
            moreThan18 = "Adult"
        } else {
            moreThan18 = "Child"
        }
    }
    

    
    @IBAction func registration(_ sender: UIButton) {
         let name = nameField.text ?? ""
         let surname = surnameField.text ?? ""
         let email = emailField.text ?? ""
         
        
        let newUser =  UserInfo(name: name, surname: surname, email: email, gender: gender, ageDetector: moreThan18)
        users.append(newUser)
        nameField.text = ""
        surnameField.text = ""
        emailField.text = ""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              let vc = segue.destination as! userInfoViewController
              vc.finalUsers = users
          }
}

