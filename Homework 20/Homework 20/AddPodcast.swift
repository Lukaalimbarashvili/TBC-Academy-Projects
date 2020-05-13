//
//  AddPodcast.swift
//  Homework 20
//
//  Created by Luka Alimbarashvili on 5/13/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class AddPodcast: UIViewController {
    
    @IBOutlet weak var PodcastName: UITextField!
    @IBOutlet weak var PodcastText: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add new Podcast"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePodcast(_ sender: Any) {

        savePodcast()
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension AddPodcast {
    
        func savePodcast() {
            let context = AppDelegate.coreDataContainer.viewContext
            
            let desc = NSEntityDescription.entity(forEntityName: "Podcast", in: context)
            
            let tempPodcast = Podcast(entity: desc!, insertInto: context)
            
            let minutes = Int(datePicker.countDownDuration / 60)
            
            tempPodcast.name = PodcastName.text!
            tempPodcast.text = PodcastText.text!
            tempPodcast.date = String("\(minutes) Min")
            
            do {
                try context.save()
            } catch {}
            
         }
}

