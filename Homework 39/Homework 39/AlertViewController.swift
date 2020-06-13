//
//  AlertViewController.swift
//  Homework 39
//
//  Created by Luka Alimbarashvili on 6/13/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var treeImage: UIImageView!
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var showAlert: UIButton!
    
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alertView.isHidden = true
        alertView.layer.cornerRadius = 15
        
        effect = blurEffect.effect
        blurEffect.effect = nil
    }
    
    func animateIn() {
        alertView.isHidden = false
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        
        UIView.animate(withDuration: 0.2) {
            self.blurEffect.effect = self.effect
            self.alertView.transform = CGAffineTransform.identity
        }
    }
    
    func animeOut() {
        
        UIView.animate(withDuration: 0.3) {
            self.alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.alertView.isHidden = true
            
            self.blurEffect.effect = nil
        }
        
        
    }
    

    @IBAction func OnShowAlert(_ sender: Any) {
        animateIn()
        showAlert.isHidden = true
    }

    @IBAction func onHideAlert(_ sender: Any) {
        animeOut()
        showAlert.isHidden = false
    }
    
    
}
