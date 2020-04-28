//
//  ViewController.swift
//  Homework9.1
//
//  Created by Luka Alimbarashvili on 4/27/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    var nameText = ""
    
    @IBOutlet weak var surname: UITextField!
    var surnameText = ""
    
    @IBOutlet weak var email: UITextField!
    var emailText = ""
    
    @IBOutlet weak var phoneNumber: UITextField!
    var phoneNumberText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func alert(title:String, message: String)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        
    }

    @IBAction func registrationDone(_ sender: Any) {
        if name.text == "" || surname.text == "" || email.text == "" || phoneNumber.text == "" {
            alert(title: "Failed", message: "Please fill all the component")
        }  else if !((email.text?.contains("@"))!)  {
            alert(title: "Failed", message: "Use @ in email")
        } else if name.text!.count < 4 || surname.text!.count < 4 {
            alert(title: "Failed", message: "Name and Surname must be more than 3 character")
        } else if phoneNumber.text!.count < 9 {
            alert(title: "Failed", message: "Phone number is incorrect")
        } else {
            self.nameText = name.text!
            self.surnameText = surname.text!
            self.emailText = email.text!
            self.phoneNumberText = phoneNumber.text!
        }
        
        performSegue(withIdentifier: "Info", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! userInfoViewController
        vc.finalName = self.nameText
        vc.finalSurname = self.surnameText
        vc.finalEmail = self.emailText
        vc.finalPhoneNumber = self.phoneNumberText
        
    }
    
}

