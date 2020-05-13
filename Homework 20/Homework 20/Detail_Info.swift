//
//  Detail_Info.swift
//  Homework 20
//
//  Created by Luka Alimbarashvili on 5/13/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Detail_Info: UIViewController {

    @IBOutlet weak var detailTopic: UILabel!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var detailTime: UILabel!
    
    
    var tempTopic = ""
    var tempText = ""
    var tempTime = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTopic.text = tempTopic
        detailText.text = tempText
        detailTime.text = tempTime
        
    }
    


}
