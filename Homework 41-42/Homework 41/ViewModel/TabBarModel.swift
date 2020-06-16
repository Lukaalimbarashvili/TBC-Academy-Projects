//
//  TabBarModel.swift
//  Homework 41
//
//  Created by Luka Alimbarashvili on 6/16/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit


struct customTabbar {
    
    var selectedIndex: Int = 0
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    lazy var homeViewController = storyboard.instantiateViewController(withIdentifier: "home_id")
    lazy var cupViewController = storyboard.instantiateViewController(withIdentifier: "cup_id")
    lazy var profileViewController = storyboard.instantiateViewController(withIdentifier: "profile_id")
     
    lazy var viewControllers = [homeViewController,cupViewController,profileViewController]
    
    mutating func TabItemOnTap(index: Int, buttons: [UIButton], sender: UIButton, viewController: UIViewController, mainView: UIView) {

        let previousIndex = selectedIndex
        selectedIndex = index

        buttons[previousIndex].isSelected = false

        let previousVC = viewControllers[previousIndex]

        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()

        sender.isSelected = true

        let vc = viewControllers[selectedIndex]

        viewController.addChild(vc)
        vc.view.frame = mainView.bounds
        mainView.addSubview(vc.view)

        vc.didMove(toParent: viewController)
    }
    

    func tabbarCorners(tabView: UIView) {
        tabView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabView.layer.cornerRadius = 40
        tabView.backgroundColor = .white
    }
    
    func CornerRadius(view: UIView, cornerRadius: CGFloat) {
        view.layer.cornerRadius = cornerRadius
    }
}



