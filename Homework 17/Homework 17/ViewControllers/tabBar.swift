//
//  tabBar.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class tabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.selectedIndex = 1
        
        if UDManager.isFirstPageLaunched() == "1" {
            self.selectedIndex = 0
        } else if UDManager.isFirstPageLaunched() == "2" {
            self.selectedIndex = 1
        } else if UDManager.isFirstPageLaunched() == "3" {
            self.selectedIndex = 2
        }
        
        
            
      }
    
}
