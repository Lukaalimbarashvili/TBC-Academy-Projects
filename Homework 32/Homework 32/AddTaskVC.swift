//
//  AddTaskVC.swift
//  Homework 32
//
//  Created by Luka Alimbarashvili on 6/2/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var addNewTask: UITextField!
    @IBOutlet weak var addTimer: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveTapped(_ sender: Any) {
        
        guard let tempName = addNewTask.text, addNewTask.hasText else { return alert(title: "Warning", message: "Dude u must write some task")}
        
        let date = addTimer.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from: date)
        print(dateString)
        
        
        save(name: tempName, time: dateString)
        tasksNotification(task: tempName, time: dateString)
        
 
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AddTaskVC {
    
    func save(name:String, time:String) {
        let context = AppDelegate.coreDataContainer.viewContext
        let newData = Task(context: context)
    
        newData.name = name
        newData.time = time
    
        do {
            try context.save()
        } catch {}
     }
}


extension AddTaskVC {
       func alert(title:String, message: String)  {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
                self.present(alert, animated: true)
          }
}
