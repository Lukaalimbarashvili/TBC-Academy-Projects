//
//  AddStoryViewController.swift
//  davaleba12
//
//  Created by Macintosh HD on 4/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
protocol AddArticle {
    func getSomeDataFromThere(story: String)
}

class AddStoryViewController: UIViewController {
    
    @IBOutlet weak var storyTextField: UITextView!
    
    var delegate : AddArticle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonActivated(_ sender: UIButton) {
        let x = storyTextField.text!
        delegate?.getSomeDataFromThere(story: x)
        self.navigationController?.popViewController(animated: true)
  
    }
    

    



}
