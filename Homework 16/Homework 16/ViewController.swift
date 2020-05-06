//
//  ViewController.swift
//  Homework 16
//
//  Created by Luka Alimbarashvili on 5/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if UDManager.isFirstPageLaunched() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let  VC = storyboard.instantiateViewController(identifier: "user_page")
            self.navigationController?.pushViewController(VC, animated: true)
        }

    }
    
    func clear() {
        usernameLabel.text = ""
        passwordLabel.text = ""
    }
    func alert(title:String, message: String)  {
             let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
             self.present(alert, animated: true)
    }



    @IBAction func logIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "user_page")
        
        if UDManager.getUsername().count == 0 && UDManager.getPassword().count == 0 { alert(title: "Warning!", message: "Username or password incorrects !") }

        if usernameLabel.text! == UDManager.getUsername() && passwordLabel.text! == UDManager.getPassword() {
            self.navigationController?.pushViewController(VC, animated: true)
        } else {
            alert(title: "warning!", message: "Username or password incorrect !")
        }
        clear()
    }
    
    @IBAction func registration(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "registration_page")
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
}

