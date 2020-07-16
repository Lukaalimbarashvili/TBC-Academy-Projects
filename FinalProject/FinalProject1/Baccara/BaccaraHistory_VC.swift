//
//  BaccaraHistory_VC.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 7/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import  CoreData

class BaccaraHistory_VC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var History = [BaccaraHistory]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    


    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func fetchData() {
         let context = AppDelegate.coreDataContainer.viewContext
    
         let request: NSFetchRequest<BaccaraHistory> = BaccaraHistory.fetchRequest()
    
         do {
             let Data = try context.fetch(request)
             History = Data
        } catch {}
     }
    
}

extension BaccaraHistory_VC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return History.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "baccaraHistory_id", for: indexPath) as! BaccaraHistoryCell
        
        cell.tempGame = History[indexPath.row]
        
        return cell
    }
    
    
}
