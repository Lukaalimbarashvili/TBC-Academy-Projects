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
    @IBOutlet weak var background: UIImageView!
    
    
    @IBOutlet weak var coffeePrice: UILabel!
    
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var cupCounterLabel: UILabel!
    @IBOutlet weak var plus: UIButton!
    
    @IBOutlet weak var addToCart: UIButton!
    
    var price = 0
    var sum = 0
    
    var tempCoffee: String? {
          didSet {
              DispatchQueue.main.async {
                  self.coffeeName.text = self.tempCoffee
                  self.coffeeImage.image = UIImage(named: self.tempCoffee!)
                
                
                switch self.tempCoffee {
                    
                  case "Espresso":
                     self.coffeePrice.text = "3$"
                     self.price = 3
                     self.sum = 3
                  case "Cappuccino":
                     self.coffeePrice.text = "4$"
                     self.price = 4
                     self.sum = 4
                  case "macciato":
                     self.coffeePrice.text = "2$"
                     self.price = 2
                     self.sum = 2
                  case "Mocha":
                     self.coffeePrice.text = "4$"
                     self.price = 4
                     self.sum = 4
                  case "latte":
                     self.coffeePrice.text = "3$"
                     self.price = 3
                     self.sum = 3
                  default:
                      self.coffeePrice.text = "7"
                  }
              }
          }
      }
    
    var cupCounter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minus.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        minus.layer.cornerRadius = 15
        
        plus.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plus.layer.cornerRadius = 15
        
        
        addToCart.layer.cornerRadius = 15
        
        backImage.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goBack))
        
        backImage.addGestureRecognizer(tapGesture)

    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func onMinus(_ sender: Any) {
        
        if cupCounter > 1 {
            cupCounter -= 1
            cupCounterLabel.text = String(cupCounter)
            sum -= price
            coffeePrice.text = "\(sum)$"
        }
       
    }
    
    @IBAction func onPlus(_ sender: Any) {
        cupCounter += 1
        sum += price
        coffeePrice.text = "\(sum)$"
        
        cupCounterLabel.text = String(cupCounter)
    }
    

}
