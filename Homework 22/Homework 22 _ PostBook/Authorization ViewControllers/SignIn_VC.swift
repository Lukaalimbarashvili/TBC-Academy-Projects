//
//  ViewController.swift
//  Homework 22 _ PostBook
//
//  Created by Luka Alimbarashvili on 5/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class SignIn_VC: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var usernameArray = [String]()
    var passwordArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PostBook"
        NotificationCenter.default.addObserver(self, selector: #selector(SignIn_VC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignIn_VC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        username.delegate = self
        password.delegate = self
    }
    
    @IBAction func SignIn(_ sender: Any) {
        fetchUser()
        var x = 0
        var showAlert = true
        while x < usernameArray.count {
            
            if username.text == usernameArray[x] && password.text == passwordArray[x] {
                UDManager.saveNumber(value: "\(x)")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let  newsVC = storyboard.instantiateViewController(identifier: "USER_POSTS")
                showAlert = false
                self.navigationController?.pushViewController(newsVC, animated: true)
                break
            }
            x += 1
        }
        
        if showAlert {
            alert(title: "Warning!", message: "Username or password Incorrect")

        }
        username.text = ""
        password.text = ""
    }
    
    @IBAction func SignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "SIGN_UP")
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func alert(title:String, message: String)  {
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
          self.present(alert, animated: true)
      }
    
}

//MARK: - ScroolView Keyboard
extension SignIn_VC {
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

//MARK: - Fetch Users

extension SignIn_VC {
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(request)
            for item in users {
                usernameArray.append(item.username!)
            }
            for item in users {
                passwordArray.append(item.password!)
            }
        } catch {}
    }
}

