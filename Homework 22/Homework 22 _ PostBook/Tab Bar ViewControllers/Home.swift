//
//  Home.swift
//  Homework 22 _ PostBook
//
//  Created by Luka Alimbarashvili on 5/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class Home: UIViewController {
    
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var allUsers = [User]()
    var allPosts = [Post]()
    
    let currentUserIndex = Int(UDManager.getNumber())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        allPosts.removeAll()
        fetchUser()
        fetchPost()
        tableView.reloadData()
    }
    
    @IBAction func AddPost(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  newsVC = storyboard.instantiateViewController(identifier: "ADD_POST") as! Home_AddPost
        self.navigationController?.pushViewController(newsVC, animated: true)
        
    }
    func updatePosts() {
        if (allUsers[currentUserIndex].userPost != nil){
           allPosts = allUsers[currentUserIndex].userPost?.allObjects as! [Post]
           }
           tableView.reloadData()
       }
    
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<User> =
            User.fetchRequest()
        
        do {
            let UserInfo = try context.fetch(request)
            allUsers.append(contentsOf: UserInfo)
        } catch {}
    }
    func fetchPost() {
           let context = AppDelegate.coreDataContainer.viewContext
           
           let request: NSFetchRequest<Post> = Post.fetchRequest()
           
           do {
               let UserInfo = try context.fetch(request)
            allPosts = allUsers[currentUserIndex].userPost?.allObjects as! [Post]
           } catch {}
       }
       
    
    
    
}
extension Home: UITableViewDelegate {
    
}
extension Home: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HOME_CELL_ID", for: indexPath) as! Home_Cell
        cell.tempUser = allUsers[currentUserIndex]
        cell.tempPost = allPosts[indexPath.row]
        return cell
    }
}
