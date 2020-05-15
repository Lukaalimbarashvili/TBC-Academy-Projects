//
//  Profile.swift
//  Homework 22 _ PostBook
//
//  Created by Luka Alimbarashvili on 5/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class Profile: UIViewController {

    @IBOutlet weak var updateName: UITextField!
    @IBOutlet weak var updateSurname: UITextField!
    @IBOutlet weak var updateUsername: UITextField!
    @IBOutlet weak var updateEmail: UITextField!
    @IBOutlet weak var updatePassword: UITextField!
    
    
    var userArray = [User]()
    let currentUserIndex = Int(UDManager.getNumber())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
                updateName.text = userArray[currentUserIndex].name
                updateSurname.text = userArray[currentUserIndex].surname
                updateUsername.text = userArray[currentUserIndex].username
                updateEmail.text = userArray[currentUserIndex].email
                updatePassword.text = userArray[currentUserIndex].password
    }
    @IBAction func updateUserInfo(_ sender: Any) {
        updateUser()
      
    }
    
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(request)
            for item in users {
                userArray.append(item)
                
            }
           
        } catch {}
    }
    
    func updateUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        userArray[currentUserIndex].name = updateName.text
        userArray[currentUserIndex].surname = updateSurname.text
        userArray[currentUserIndex].username = updateUsername.text
        userArray[currentUserIndex].email = updateEmail.text
        userArray[currentUserIndex].password = updatePassword.text
        do {
            try context.save()

        } catch {}
    }
    
}
