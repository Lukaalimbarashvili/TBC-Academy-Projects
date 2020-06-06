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

class testVC: UIViewController {

    @IBOutlet weak var garika: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var test2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FIRST ATTEMPT
        view.showAnimatedGradientSkeleton()
        view.isSkeletonable = true
        

        
        // Second attemp
        let myView = UIView()
        myView.backgroundColor = .red
        
        
        let shimmerView = ShimmeringView(frame: CGRect(x: 120, y: 280, width: 180, height: 80))
        view.addSubview(shimmerView)
        shimmerView.contentView = myView
        
        shimmerView.isShimmering = true
        
        // Third attemp
        
        let gradientLayer = CAGradientLayer()
         gradientLayer.colors = [UIColor.gray.cgColor,UIColor.white.cgColor]
         gradientLayer.locations = [0,1]
         gradientLayer.frame = test2Label!.frame
         
         let angel = 45 * CGFloat.pi / 180
         gradientLayer.transform = CATransform3DMakeRotation(angel, 0, 0, 1)
         test2Label?.layer.mask = gradientLayer
         
         let animation = CABasicAnimation(keyPath: "transform.translation.x")
         animation.duration = 2
         animation.fromValue = -view!.frame.width
         animation.toValue   =  view?.frame.width
         
         animation.repeatCount = Float.infinity
         gradientLayer.add(animation, forKey: "oke")

    }
    



}
