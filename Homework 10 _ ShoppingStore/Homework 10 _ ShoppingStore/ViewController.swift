//
//  ViewController.swift
//  Homework 10 _ ShoppingStore
//
//  Created by Luka Alimbarashvili on 4/28/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var foodQuantity: UITextField!
    @IBOutlet weak var FoodPrice: UITextField!
    @IBOutlet weak var foodPickerView: UIPickerView!
    @IBOutlet weak var foodCounter: UILabel!
    
    let allFoodTypes = [ "Vegetables", "Fruit", "Cereal", "Meat" ]
    var specificFoodType = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allFoodTypes[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allFoodTypes.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        specificFoodType = allFoodTypes[row]
    }
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
   var arrayofFoods = [[String]]()
   var x = [String]()
    
    @IBAction func addFood(_ sender: Any) {
        if (foodName.text?.count)! < 4 { return alert(title: "Warning!", message: "Product name must be more that 4 character") }
        let name = foodName.text!
        
        if foodQuantity.text == "" { return alert(title: "Warning!", message: "How much \(foodName.text!) you want ?") }
        let quantity = foodQuantity.text!  //keyboard type is Numper Pad so i force unwrapp it
        
        if FoodPrice.text == "" { return alert(title: "Warning!", message: "Please fill in Price tag") }
        let price = FoodPrice.text!      //keyboard type is Numper Pad so i force unwrapp it
        let type = specificFoodType
        
        let foodInfo = [name,quantity,price,type]
        arrayofFoods.append(foodInfo)
        self.foodCounter.text = String(arrayofFoods.count)
        foodName.text = ""
        foodQuantity.text = ""
        FoodPrice.text = ""
        x.append(specificFoodType)
    }
   
    var price = 0
    var quantitiy = 0
    @IBAction func calculateProducts(_ sender: Any) {
 
        for item in arrayofFoods {
            price += Int(item[1])! * Int(item[2])!
            quantitiy += Int(item[1])!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                  let vc = segue.destination as! foodInfoViewController
                  vc.finalSum = String(self.price)
                  vc.finalQuantitiy = String(self.quantitiy)
                  vc.finalFoods = self.arrayofFoods
                  vc.favorite = self.x
        
              }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

