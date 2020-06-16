//
//  Main_VC.swift
//  Homework 41
//
//  Created by Luka Alimbarashvili on 6/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Main_VC: UIViewController {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet var buttons : [UIButton]!
    
    var tabbar = customTabbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabbar.CornerRadius(view: mainView, cornerRadius: 15)
        tabbar.TabItemOnTap(index: 0, buttons: buttons, sender: buttons[0], viewController: self, mainView: mainView)
        tabbar.tabbarCorners(tabView: tabBarView)

    }
    
    @IBAction func didPressTap(_ sender: UIButton) {
        tabbar.TabItemOnTap(index: sender.tag, buttons: buttons, sender: sender, viewController: self, mainView: mainView)
    }
    

}
