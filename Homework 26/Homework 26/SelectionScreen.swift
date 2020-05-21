//
//  SelectionScreen.swift
//  Homework 26
//
//  Created by Luka Alimbarashvili on 5/21/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class SelectionScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func imperialButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: .darkNotificationKey, object: nil)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func rebelButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: .lightNotificationKey, object: nil)
        dismiss(animated: true, completion: nil)
    }

    deinit {
           NotificationCenter.default.removeObserver(self)
       }
}
