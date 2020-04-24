//
//  ViewController.swift
//  Homework8 -2
//
//  Created by Luka Alimbarashvili on 4/24/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var onClick: UIButton!
    @IBOutlet weak var appleLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onClick.layer.cornerRadius = 15
        self.appleLogo.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        
        if usernameField.text == "" || passwordField.text == "" || usernameField.text!.count < 5 || passwordField.text!.count < 5 {
            
        let alert = UIAlertController(title: "Failed", message: "Username or Password incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
        self.present(alert, animated: true)
            
        }
        else  {
    
        let alert = UIAlertController(title: "Congratulation", message: "Press next to continue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Next", style: .cancel, handler: nil))
        self.present(alert, animated: true)
            
        }
        
        
    }
    
}

