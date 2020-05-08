//
//  EditView.swift
//  Homework 18 _ Notes App
//
//  Created by Luka Alimbarashvili on 5/8/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class EditView: UIViewController {

    @IBOutlet weak var editText: UITextView!
    
    
    var tempText = ""
    var tempURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editText.text = tempText
    }
    


    @IBAction func editText(_ sender: Any) {
        
        let newValue = editText.text
        
        do {
        try "\(newValue!)".write(to: tempURL!, atomically: true, encoding: .utf8)
        } catch {
            
        }
        self.navigationController?.popViewController(animated: true)


    }
    
}
