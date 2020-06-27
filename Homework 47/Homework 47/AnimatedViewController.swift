//
//  AnimatedViewController.swift
//  Homework 47
//
//  Created by Luka Alimbarashvili on 6/28/20.
//  Copyright © 2020 lucas. All rights reserved.
//


import UIKit

class AnimatedViewController: UIViewController {
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = UIImage(named: image!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

    
    
}

