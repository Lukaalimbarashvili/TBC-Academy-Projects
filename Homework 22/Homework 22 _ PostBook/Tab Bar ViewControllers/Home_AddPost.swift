//
//  Home_AddPost.swift
//  Homework 22 _ PostBook
//
//  Created by Luka Alimbarashvili on 5/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class Home_AddPost: UIViewController {
    
    @IBOutlet weak var addPostLabel: UILabel!
    @IBOutlet weak var newPost: UITextView!
    
    var userArray = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
    
    
    @IBAction func saveNewPost(_ sender: Any) {
        let currentUserIndex = Int(UDManager.getNumber())!
        createPost(user: userArray[currentUserIndex])
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension Home_AddPost {
    
    
    //MARK: - აქ ვერ დავამატე რომ ბევრი პოსტები ქონდეს მარტო ერთს უთითებს
    func createPost(user: User) {
      let context = AppDelegate.coreDataContainer.viewContext

      let notEntityDescription = NSEntityDescription.entity(forEntityName: "Post", in: context)
      let post = Post(entity: notEntityDescription!, insertInto: context)
      post.post = newPost.text!
      post.date = Date()
      user.userPost = post
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
                userArray.append(item)
                
            }
           
        } catch {}
    }
}
