//
//  addText.swift
//  Homework 19
//
//  Created by Luka Alimbarashvili on 5/11/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class addText: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var changeButtonTitle: UIButton!
    
    var tempTextView = ""
    
    var tempURL2: URL?
    
    var isEditingText = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Text"
        
        textView.text = tempTextView

        if isEditingText {
            changeButtonTitle.setTitle("Edit", for: .normal)
        }
    }
    

    @IBAction func addText(_ sender: Any) {
      let newText = textView.text ?? ""

      let newNoteIndex = UDManager.getNumber()
      let z = Int(newNoteIndex)! + 1
      UDManager.saveNumber(value: "\(z)")
       
        if isEditingText {
            do {
                if !(textView.hasText) { return alert(title: "Warning", message: "There is no text")}
                try! "\(newText)".write(to: tempURL2!, atomically: true, encoding: .utf8)
            } 
        } else {
            if !(textView.hasText) { return alert(title: "Warning", message: "There is no text")}
            let customManager = MyFileManager.customManager
            customManager.createFile(name: "Note\(newNoteIndex)", text: newText ,ext: .txt, path: tempURL2!)
        }
        
      self.navigationController?.popViewController(animated: true)
    }
    
    
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

}
