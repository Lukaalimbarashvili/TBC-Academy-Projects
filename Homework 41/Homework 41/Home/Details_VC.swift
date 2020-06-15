//
//  Details_VC.swift
//  Homework 41
//
//  Created by Luka Alimbarashvili on 6/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Details_VC: UIViewController {

    @IBOutlet weak var coffeeName: UILabel!
    
    @IBOutlet weak var coffeeImage: UIImageView!
    
    @IBOutlet weak var backImage: UIImageView!
    
     var tempName: String? {
            didSet {
                DispatchQueue.main.async {
                    self.coffeeName.text = self.tempName
                }
        }
    }
    
    var tempImage: String? {
        didSet {
            DispatchQueue.main.async {
                self.coffeeImage.image = UIImage(named: self.tempImage!)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backImage.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goBack))
        
        backImage.addGestureRecognizer(tapGesture)

    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }

}
