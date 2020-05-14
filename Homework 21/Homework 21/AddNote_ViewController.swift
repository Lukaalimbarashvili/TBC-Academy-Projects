//
//  AddNote_ViewController.swift
//  Homework 21
//
//  Created by Luka Alimbarashvili on 5/14/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class AddNote_ViewController: UIViewController {

    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var noteText: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var tempTopic = "Add Note"
    var newTempNote: Notes?
    var tempButton = "Save"
    var EditingMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topicLabel.text = tempTopic
        noteText.text = newTempNote?.note
        saveButton.setTitle(tempButton, for: .normal)
    }
    

    @IBAction func saveNewNote(_ sender: Any) {
        if EditingMode {
            updateNote()
        } else {
            saveNote()
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func saveNote() {
            let context = AppDelegate.coreDataContainer.viewContext
            
            let notes = Notes(context: context)
            
            notes.note = noteText.text!
          
            do {
                try context.save()

            } catch {}
            
         }
    func updateNote() {
        let context = AppDelegate.coreDataContainer.viewContext
        newTempNote?.note = noteText.text!
        do {
            try context.save()
            print("yeaa babe")
        } catch {}
    }

}


