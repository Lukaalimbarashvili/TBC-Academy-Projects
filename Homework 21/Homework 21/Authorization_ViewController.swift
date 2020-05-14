//
//  ViewController.swift
//  Homework 21
//
//  Created by Luka Alimbarashvili on 5/14/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class Authorization_ViewController: UIViewController {
    
    @IBOutlet weak var finalUsername: UITextField!
    @IBOutlet weak var finalPassword: UITextField!
    
    var tempUsername = [String]()
    var tempPassword = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        
        fetchUser()
        var x = 0
        var showAlert = true
        while x < tempUsername.count {
            
            if finalUsername.text == tempUsername[x] && finalPassword.text == tempPassword[x] {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let  newsVC = storyboard.instantiateViewController(identifier: "NOTES_TABLE")
                showAlert = false
                self.navigationController?.pushViewController(newsVC, animated: true)
                break
            }
            x += 1
        }
        
        if showAlert {
          alert(title: "Warning!", message: "Username or password Incorrect")
        }
        
    }
    
    @IBAction func registration(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  newsVC = storyboard.instantiateViewController(identifier: "REGISTRATION")
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(request)
            for item in users {
                tempUsername.append(item.name!)
            }
            for item in users {
                tempPassword.append(item.password!)
            }
        } catch {}
    }
    
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

