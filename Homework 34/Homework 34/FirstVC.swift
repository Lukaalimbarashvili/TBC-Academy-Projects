//
//  ViewController.swift
//  Homework 34
//
//  Created by Luka Alimbarashvili on 6/4/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(goRight))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    @objc func goRight() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "SecondVC")
        self.navigationController?.pushViewController(VC, animated: true)
    }

}

