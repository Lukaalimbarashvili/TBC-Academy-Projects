//
//  SecondVC.swift
//  Homework 34
//
//  Created by Luka Alimbarashvili on 6/4/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

           let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(goRight))
           let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(goLeft))
           swipeRight.direction = .left
           swipeLeft.direction = .right
           self.view.addGestureRecognizer(swipeRight)
           self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func goRight() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "ThirdVC")
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func goLeft() {
        self.navigationController?.popViewController(animated: true)
    }



}
