//
//  ChooseTime.swift
//  Homework 20
//
//  Created by Luka Alimbarashvili on 5/13/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

protocol FilterMode {
    func getData(time: Int, filterMode: Bool)
}

class ChooseTime: UIViewController {

    @IBOutlet weak var chooseTime: UITextField!
    
     var delegate : FilterMode?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func chooseTime(_ sender: Any) {
        let tempTime = Int(chooseTime.text!)
        delegate?.getData(time: tempTime!, filterMode: true)
        
        self.navigationController?.popViewController(animated: true)
    }
    

}

