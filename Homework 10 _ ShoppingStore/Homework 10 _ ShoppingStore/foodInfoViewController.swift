//
//  foodInfoViewController.swift
//  Homework 10 _ ShoppingStore
//
//  Created by Luka Alimbarashvili on 4/28/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class foodInfoViewController: UIViewController {

    @IBOutlet weak var sumOfPrice: UILabel!
    @IBOutlet weak var allFood: UILabel!
    @IBOutlet weak var allQuantitiy: UILabel!
    @IBOutlet weak var favoriteType: UILabel!
    
    var finalSum = ""
    var finalQuantitiy = ""
    var finalFoods = [[String]]()
    var favorite = [String]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sumOfPrice.text = "Total Price : \(finalSum) $"
        allQuantitiy.text = "Total Quantitiy : \(finalQuantitiy) Kg"
        favoriteType.text = "seems u like \(favorite.joined(separator: ","))"
    
        var x = [String]()
        for item in finalFoods {
            x.append("\(item[0]) : \(item[1])")
        }

        for _ in x {
        allFood.text = "Ordered Food  \n\n\(x.joined(separator: "\n"))"
                }


 }
}
