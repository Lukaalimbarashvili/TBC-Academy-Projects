//
//  chatAddView.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit


protocol AddChat {
     func getSomeDataFromThere(array: chatData)
}

class chatAddView: UIViewController {
    
    @IBOutlet weak var sendMessageTo: UITextField!
    @IBOutlet weak var message: UITextView!
    
    
    var delegate : AddChat?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        
        let image = "img"
        let sendTo = sendMessageTo.text!
        let sendMessage = message.text!
        
        let messageInstance = chatData(image: image, name: sendTo, message: sendMessage)
        
        delegate?.getSomeDataFromThere(array: messageInstance)
        self.navigationController?.popViewController(animated: true)
    }
    
}
