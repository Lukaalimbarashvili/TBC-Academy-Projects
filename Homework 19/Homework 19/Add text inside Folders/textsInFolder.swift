//
//  addTextViewController.swift
//  Homework 19
//
//  Created by Luka Alimbarashvili on 5/11/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class textsInFolder: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tempURL: URL?
    var isEditingText = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "My Texts"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    

    @IBAction func addText(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(withIdentifier: "ADDTEXT") as! addText
        VC.tempURL2 = tempURL
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    

}




extension textsInFolder: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           let customManager = MyFileManager.customManager
           return customManager.contentsOf(url: tempURL!).count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
           let cell = tableView.dequeueReusableCell(withIdentifier: "TABLEVIEW_CELL", for: indexPath) as! TableViewCell
        
           
           let customManager = MyFileManager.customManager
           
           let x = customManager.contentsOf(url: tempURL!)[indexPath.row]
           
           cell.finalText.text = customManager.readText(url: x)
           return cell
       }
    
    
}


extension textsInFolder: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action,view,handler) in
            let customManager = MyFileManager.customManager
            let x = customManager.contentsOf(url: self.tempURL!)[indexPath.row]
            customManager.delete(at: x)
            tableView.reloadData()
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action,view,handler) in
            
             self.isEditingText = true

             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let addStoryPage = storyboard.instantiateViewController(withIdentifier: "ADDTEXT") as! addText
            
             let customManager = MyFileManager.customManager
             let x = customManager.contentsOf(url: self.tempURL!)[indexPath.row]
             addStoryPage.tempTextView = customManager.readText(url: x)
             addStoryPage.tempURL2 = x
             addStoryPage.isEditingText = self.isEditingText
             self.navigationController?.pushViewController(addStoryPage, animated: true)
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
    
}
