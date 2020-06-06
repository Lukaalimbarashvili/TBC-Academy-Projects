//
//  opanaController.swift
//  Homework 35
//
//  Created by Luka Alimbarashvili on 6/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import SkeletonView
import ShimmerSwift

class opanaController: UIViewController {

    @IBOutlet weak var garika: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.showAnimatedGradientSkeleton()
        view.isSkeletonable = true
        
        
        let myView = UIView()
        myView.backgroundColor = .red
        
        
        let shimmerView = ShimmeringView(frame: CGRect(x: 120, y: 280, width: 180, height: 80))
        view.addSubview(shimmerView)
        shimmerView.contentView = myView
        
        shimmerView.isShimmering = true

    }
    



}
