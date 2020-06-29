//
//  ViewController.swift
//  Homework 50
//
//  Created by Luka Alimbarashvili on 6/29/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainSquare: UIView!
    
    
    @IBOutlet weak var damping: UILabel!
    @IBOutlet weak var velocity: UILabel!
    @IBOutlet weak var rotation: UILabel!
    @IBOutlet weak var scale: UILabel!
    
    
    
    
    @IBOutlet weak var firstPickerView: UIPickerView!
    
    
    var firstAnimations = ["Pop", "Shake", "Squeeze"]
    var secondAnimations = ["easeIn","easeOut","easeInOut","lineear"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainSquare.layer.cornerRadius = 10
        
    }
    
    @IBAction func onDamping(_ sender: UISlider) {
        mainAnimation(Damping: CGFloat(sender.value))
        damping.text = "Damping : \(sender.value)"
    }
    
    @IBAction func onVelocity(_ sender: UISlider) {
         mainAnimation(Velocity: CGFloat(sender.value))
         velocity.text = "Velocity : \(sender.value)"
    }
    
    @IBAction func onRotation(_ sender: UISlider) {
        mainAnimation(rotationAngle: CGFloat(sender.value))
        rotation.text = "Rotation : \(sender.value)"
    }
    
    @IBAction func onScale(_ sender: UISlider) {
        mainAnimation(scale: CGFloat(sender.value))
        scale.text = "Scale : \(sender.value)"
    }
    
    
    
    func mainAnimation(Damping: CGFloat = 0.5, Velocity: CGFloat = 15, animation: UIView.AnimationOptions = .curveEaseIn, scale: CGFloat = 2.5, rotationAngle: CGFloat = .pi / 2) {
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: Damping, initialSpringVelocity: Velocity, options: animation, animations: {
            
            self.mainSquare.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.mainSquare.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }) { (ok) in
            UIView.animate(withDuration: 0.5) {
                self.mainSquare.transform = .identity
            }
        }
    }
    
}


extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return firstAnimations.count
        } else {
            return secondAnimations.count
        }
        
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return firstAnimations[row]
        } else {
            return secondAnimations[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            if firstAnimations[row] == "Shake" {
                mainSquare.shake(duration: 1)
            } else if firstAnimations[row] == "Pop" {
                mainSquare.pop()
            }
        } else {
            
            
            if secondAnimations[row] == "easeIn" {
                mainAnimation(animation: .curveEaseIn)
            } else if secondAnimations[row] == "easeOut" {
                mainAnimation(animation: .curveEaseOut)
            } else if secondAnimations[row] == "easeInOut" {
                mainAnimation(animation: .curveEaseInOut)
            } else if secondAnimations[row] == "lineear"{
                mainAnimation(animation: .curveLinear)
            }
            
            
            
        }
        
        
        
    }
}


