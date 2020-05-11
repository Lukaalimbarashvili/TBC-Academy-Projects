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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        print(tempURL!)
    }
    

    @IBAction func addText(_ sender: Any) {
        
    }
    

}



extension textsInFolder: UITableViewDelegate {
    
}
extension textsInFolder: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           let customManager = MyFileManager.customManager
           return customManager.contentsOf(url: tempURL!).count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
           let cell = tableView.dequeueReusableCell(withIdentifier: "TABLEVIEW_CELL", for: indexPath) as! TableViewCell
//           
//           let customManager = MyFileManager.customManager
//           
//           let tempURL = customManager.contentsOf(url: customManager.mainPath)[indexPath.row]
//           
//           cell.textLabel?.text = customManager.readText(url: tempURL)
           cell.finalText.text = "iha"
           return cell
       }
    
    
}
