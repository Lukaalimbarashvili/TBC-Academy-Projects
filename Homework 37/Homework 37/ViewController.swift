//
//  ViewController.swift
//  Homework 37
//
//  Created by Luka Alimbarashvili on 6/9/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeArt()
    }
    
    
}



extension ViewController {
    func makeArt() {
        mainView.backgroundColor = .systemGreen
        
        let blackX = mainView.frame.width / 2
        let blackY = mainView.frame.height / 2
        
        let blackLayer = CALayer()
        blackLayer.backgroundColor = UIColor.black.cgColor
        blackLayer.frame = CGRect(x: blackX - 150, y: blackY - 150, width: 300, height: 300)
        blackLayer.cornerRadius = 150
        
        mainView.layer.addSublayer(blackLayer)
        
        
        let whiteX = blackLayer.frame.width / 2
        let whiteY = blackLayer.frame.height / 2
        
        let whiteLayer = CALayer()
        whiteLayer.backgroundColor = UIColor.white.cgColor
        whiteLayer.frame = CGRect(x: whiteX - 115, y: whiteY - 115, width: 230, height: 230)
        whiteLayer.cornerRadius = 115
        
        whiteLayer.borderWidth = 2
        whiteLayer.borderColor = UIColor(red:230/255, green:38/255, blue:38/255, alpha: 1).cgColor
        
        blackLayer.addSublayer(whiteLayer)
        
    }
}
