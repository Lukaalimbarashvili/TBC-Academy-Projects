//
//  UserPage.swift
//  Homework 16
//
//  Created by Luka Alimbarashvili on 5/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class UserPage: UIViewController {

    @IBOutlet weak var finalName: UILabel!
    @IBOutlet weak var finalEmail: UILabel!
    @IBOutlet weak var userNotes: UITextView!
    @IBOutlet weak var bglabel: UILabel!
    @IBOutlet weak var PickColor: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalName.text = UDManager.getUsername()
        finalEmail.text = UDManager.getEmail()
        userNotes.text = UDManager.getNote()
        UDManager.markFirstPageIsLaunched()
        
        if UDManager.getBgcolor() == "systemPink" {
            view.backgroundColor = .systemPink
        } else if UDManager.getBgcolor() == "systemTeal" {
            view.backgroundColor = .systemTeal
        }
        
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch PickColor.selectedSegmentIndex
        {
        case 0:
            view.backgroundColor = .systemPink
            UDManager.saveBgcolor(value: "systemPink")
        case 1:
            view.backgroundColor = .systemTeal
            UDManager.saveBgcolor(value: "systemTeal")
        default:
            break
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let note = userNotes.text!
        UDManager.saveNote(value: note)
        
    }
        
    @IBAction func signOut(_ sender: Any) {
        UDManager.unmarkFirstPageIsLaunched()
        self.navigationController?.popViewController(animated: true)
    }
    



}
