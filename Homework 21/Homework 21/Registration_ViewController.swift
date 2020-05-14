//
//  Registration_ViewController.swift
//  Homework 21
//
//  Created by Luka Alimbarashvili on 5/14/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Registration_ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    

    @IBAction func signUp(_ sender: Any) {
        signUp_data()
        self.navigationController?.popViewController(animated: true)     
    }
    
    func signUp_data() {
        let context = AppDelegate.coreDataContainer.viewContext
        let user = User(context: context)
        
        user.name = username.text!
        user.password = password.text!
        
        do {
            try context.save()
        } catch {}
    }

}
