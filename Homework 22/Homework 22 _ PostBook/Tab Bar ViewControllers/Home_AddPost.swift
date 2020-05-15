//
//  Home_AddPost.swift
//  Homework 22 _ PostBook
//
//  Created by Luka Alimbarashvili on 5/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

//protocol postPageProtocol {
//    func updatePosts()
//}

class Home_AddPost: UIViewController {
    
    @IBOutlet weak var addPostLabel: UILabel!
    @IBOutlet weak var newPost: UITextView!
    
    var userArray = [User]()
//    var postProcotol: postPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
    let currentUserIndex = Int(UDManager.getNumber())!
    
    @IBAction func saveNewPost(_ sender: Any) {
        
        createPost(user: userArray[currentUserIndex])
//        print(userArray[currentUserIndex].userPost?.count)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension Home_AddPost {
    
    func createPost(user: User) {
      let context = AppDelegate.coreDataContainer.viewContext

      let notEntityDescription = NSEntityDescription.entity(forEntityName: "Post", in: context)
      let post = Post(entity: notEntityDescription!, insertInto: context)
      post.user = userArray[currentUserIndex]
      post.post = newPost.text!
      post.date = Date()
      do {
        try context.save()
//        print(post.post)
//        postProcotol?.updatePosts()
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
