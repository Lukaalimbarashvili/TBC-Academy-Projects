//
//  ThirdVC.swift
//  Homework 34
//
//  Created by Luka Alimbarashvili on 6/4/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(goLeft))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        startButton.backgroundColor = .clear
        startButton.layer.cornerRadius = 5
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.black.cgColor
        
    }
    

    @objc func goLeft() {
        self.navigationController?.popViewController(animated: true)
    }

}
