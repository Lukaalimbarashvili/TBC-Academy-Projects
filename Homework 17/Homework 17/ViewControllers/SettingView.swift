//
//  SettingView.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class SettingView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        UDManager.markThirdTabBar()
    }

}
