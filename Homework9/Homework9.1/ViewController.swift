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
  

    @IBAction func registrationDone(_ sender: Any) {
        if name.text == "" || surname.text == "" || email.text == "" || phoneNumber.text == "" {
            
            let alert = UIAlertController(title: "Failed", message: "Please fill all the component", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
        }  else if !((email.text?.contains("@"))!)  {
            
            let alert = UIAlertController(title: "Failed", message: "use @ in email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
        } else if name.text!.count < 4 || surname.text!.count < 4 {
            
            let alert = UIAlertController(title: "Failed", message: "name and surname must be more than 3 character", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
        } else if phoneNumber.text!.count < 9 {
            let alert = UIAlertController(title: "Failed", message: "Phone number is incorrect", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
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

