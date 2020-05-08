//
//  ViewController.swift
//  Homework 18 _ Notes App
//
//  Created by Luka Alimbarashvili on 5/8/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    
    @IBAction func addNote(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addStoryPage = storyboard.instantiateViewController(withIdentifier: "add_note")
        self.navigationController?.pushViewController(addStoryPage, animated: true)
    }
    let customManager = MyFileManager.customManager
    
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let customManager = MyFileManager.customManager
        return customManager.contentsOf(url: customManager.mainPath).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "NOTES_CELL", for: indexPath) as! NotesCell
        
        let customManager = MyFileManager.customManager
        
        let tempURL = customManager.contentsOf(url: customManager.mainPath)[indexPath.row]
        
        cell.textLabel?.text = customManager.readText(url: tempURL)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addStoryPage = storyboard.instantiateViewController(withIdentifier: "DETAIL_INFO") as! DetailInfoView

        let x = self.customManager.contentsOf(url: self.customManager.mainPath)[indexPath.row]
        addStoryPage.tempInfo = customManager.readText(url: x)
        self.navigationController?.pushViewController(addStoryPage, animated: true)
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action,view,handler) in
            let tempURL = self.customManager.contentsOf(url: self.customManager.mainPath)[indexPath.row]
            self.customManager.delete(at: tempURL)
            tableView.reloadData()
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action,view,handler) in
          
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let addStoryPage = storyboard.instantiateViewController(withIdentifier: "EDIT_VIEW") as! EditView
            
             let x = self.customManager.contentsOf(url: self.customManager.mainPath)[indexPath.row]
             addStoryPage.tempText = self.customManager.readText(url: x)
             addStoryPage.tempURL = x
            
             self.navigationController?.pushViewController(addStoryPage, animated: true)

        }
        
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
    
}



