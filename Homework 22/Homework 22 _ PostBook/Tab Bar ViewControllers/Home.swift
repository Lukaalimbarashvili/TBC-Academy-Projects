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
    
    var allPosts = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        allPosts.removeAll()
        fetchUser()
        tableView.reloadData()
    }
    
    @IBAction func AddPost(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  newsVC = storyboard.instantiateViewController(identifier: "ADD_POST")
        self.navigationController?.pushViewController(newsVC, animated: true)
        
    }
    
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<User> =
            User.fetchRequest()
        
        do {
            let UserInfo = try context.fetch(request)
            allPosts.append(contentsOf: UserInfo)
        } catch {}
    }
    
    
    
}
extension Home: UITableViewDelegate {
    
}
extension Home: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //MARK: - აქ უსერზე ბევრი პოსტის გაკეთება რომ მცოდნოდა დავწერდი user.userpost.count
        return allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HOME_CELL_ID", for: indexPath) as! Home_Cell
        cell.tempUser = allPosts[indexPath.row]
        return cell
    }
}
