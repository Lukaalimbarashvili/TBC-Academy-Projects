//
//  chatDetailsView.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class chatDetailsView: UIViewController {
    
    
    
    

    @IBOutlet weak var detailedImage: UIImageView!
    @IBOutlet weak var detailedName: UILabel!
    @IBOutlet weak var detailedMessage: UILabel!
    

    var x = ""
    var y = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the vie
        detailedName.text = x
        detailedMessage.text = y

    }
    

   
}
