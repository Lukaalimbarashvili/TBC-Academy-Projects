//
//  AddView.swift
//  Homework 18 _ Notes App
//
//  Created by Luka Alimbarashvili on 5/8/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit


class AddView: UIViewController {


    @IBOutlet weak var addText: UITextView!
    @IBOutlet weak var mainLabel: UILabel!
    

    
    var tempText = ""
    var tempMainLabel = "Write Notes Here :"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addText.text = tempText
        mainLabel.text = tempMainLabel
    }
    
 
    @IBAction func addTextToCell(_ sender: Any) {

        guard let newNote =  addText.text,  addText.hasText else {return alert(title: "Warning", message: "please fill in Note Field")}


        let newNoteIndex = UDManager.getNumber()
        let z = Int(newNoteIndex)! + 1
        UDManager.saveNumber(value: "\(z)")
        
        let customManager = MyFileManager.customManager
        customManager.createFile(name: "Note\(newNoteIndex)", text: newNote ,ext: .txt)
     
        self.navigationController?.popViewController(animated: true)
    }
    
    
       func alert(title:String, message: String)  {
              let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
              self.present(alert, animated: true)
        }
}
