//
//  Extensions.swift
//  Homework 50
//
//  Created by Luka Alimbarashvili on 6/29/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit


extension UIView {
    
    func shake(duration: CFTimeInterval) {
        let shakeValues = [-15, 15, -15, 15, -13, 13, -12, 12, 0]

        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        translation.timingFunction = CAMediaTimingFunction(name: .linear)
        translation.values = shakeValues
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = shakeValues.map { (Int(Double.pi) * $0) / 180 }
        
        let shakeGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = 0.5
        layer.add(shakeGroup, forKey: "shakeIt")
    }
    
    
    func pop() {
        self.alpha = 0
            
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
        self.transform = CGAffineTransform(scaleX: 5, y: 5)
        self.alpha = 1
        self.transform = .identity
        })
    }
    
    
}



