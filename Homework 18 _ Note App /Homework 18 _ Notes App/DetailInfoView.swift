//
//  DetailInfoView.swift
//  Homework 18 _ Notes App
//
//  Created by Luka Alimbarashvili on 5/8/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class DetailInfoView: UIViewController {

    @IBOutlet weak var detailedLabel: UILabel!
     var tempInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedLabel.text = tempInfo
    }
    
   
    

}
