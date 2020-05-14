//
//  Notes_ViewController.swift
//  Homework 21
//
//  Created by Luka Alimbarashvili on 5/14/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class Notes_ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var allNote = [Notes]()
    var tempNote: Notes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        allNote.removeAll()
        fetchUser()
        tableView.reloadData()
    }
    
    
    @IBAction func AddNewNote(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  newsVC = storyboard.instantiateViewController(identifier: "ADD_NOTE")
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Notes> = Notes.fetchRequest()
        
        do {
            let Notes = try context.fetch(request)
            allNote.append(contentsOf: Notes)
        } catch {}
    }
    func deleteNote(note: Notes) {
        let context = AppDelegate.coreDataContainer.viewContext
        context.delete(note)
        
        do {
            try context.save()
        } catch {}
    }
    
    
}


extension Notes_ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action,view,handler) in
            
            self.deleteNote(note: self.allNote[indexPath.row])
            self.allNote.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action,view,handler) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "ADD_NOTE") as! AddNote_ViewController
            self.tempNote = self.allNote[indexPath.row]
            VC.newTempNote = self.tempNote
            VC.tempTopic = "Edit Note"
            VC.tempButton = "Edit"
            VC.EditingMode = true
            self.navigationController?.pushViewController(VC, animated: true)
            
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        return config
    }
}
extension Notes_ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NOTECELL_ID", for: indexPath) as! Notes_Cell
        cell.tempNote = allNote[indexPath.row]
        return cell
    }
    
    
}
