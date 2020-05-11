//
//  AddFolderViewController.swift
//  Homework 19
//
//  Created by Luka Alimbarashvili on 5/11/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class AddFolderViewController: UIViewController {

    @IBOutlet weak var folderName: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Folder"
    }
    

    @IBAction func addFolder(_ sender: Any) {
        
        guard let finalFolderName = folderName.text, folderName.hasText else { return  alert(title: "Warning !", message: "Please type Folder Name")}
    
        let customManager = MyFileManager.customManager
        customManager.createFolder(folderName: finalFolderName)
        self.navigationController?.popViewController(animated: true)

    }
    
    
    
    
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

}
