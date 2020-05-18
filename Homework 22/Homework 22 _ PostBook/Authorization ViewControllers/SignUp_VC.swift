//
//  SignUp_VC.swift
//  Homework 22 _ PostBook
//
//  Created by Luka Alimbarashvili on 5/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class SignUp_VC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let imagePicker = UIImagePickerController()
    var user = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create New User"
        NotificationCenter.default.addObserver(self, selector: #selector(SignIn_VC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignIn_VC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        name.delegate = self
        surname.delegate = self        
        username.delegate = self
        email.delegate = self
        password.delegate = self
        
        
    }
    
    @IBAction func AddPhoto(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func SignUp(_ sender: Any) {
        signUpUser()
        fetchUser()
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

//MARK: - ScroolView Keyboard
extension SignUp_VC {
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

//MARK: - Choose and Set Image
extension SignUp_VC {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.photo.image = image
        }
        self.dismiss(animated: true)
      }
}

//MARK: - Sign Up new User
extension SignUp_VC {
    func signUpUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        let user = User(context: context)
        
        if let binaryImage = photo.image?.pngData() {
            user.image = binaryImage
        }
        user.name = username.text!
        user.surname = surname.text!
        user.username = username.text!
        user.email = email.text!
        user.password = password.text!
        
        do {
            try context.save()
        } catch {}
    }
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(request)
            for item in users {
                user.append(item)
                print(users.count)
                print("-------")
                print(item)
                print("-------")

            }
           
        } catch {}
    }
}
