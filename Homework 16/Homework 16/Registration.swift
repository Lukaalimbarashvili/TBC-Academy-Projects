//
//  Registration.swift
//  Homework 16
//
//  Created by Luka Alimbarashvili on 5/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Registration: UIViewController {
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alert(title:String, message: String)  {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
                self.present(alert, animated: true)
       }

    @IBAction func userRegister(_ sender: Any) {
        
        guard let username = usernameLabel.text, usernameLabel.hasText else { return alert(title: "Warning!", message: "Please fill all component")}
        guard let email = emailLabel.text, emailLabel.hasText else { return alert(title: "Warning!", message: "Please fill all component")}
        guard let password = passwordLabel.text, passwordLabel.hasText else { return alert(title: "Warning!", message: "Please fill all component")}

        UDManager.saveUsername(value: username)
        UDManager.saveEmail(value: email)
        UDManager.savePassword(value: password)
        UDManager.saveNote(value: "Whats on your mind?")
        UDManager.saveBgcolor(value: "")
      

        self.navigationController?.popViewController(animated: true)
    }
    
    

}
