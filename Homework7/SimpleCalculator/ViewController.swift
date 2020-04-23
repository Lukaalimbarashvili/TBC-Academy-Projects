//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Luka Alimbarashvili on 4/23/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var calcSegment: UISegmentedControl!
    @IBOutlet weak var Slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var newResult: String = ""
    @IBAction func calcSegment(_ sender: Any) {
        
        switch calcSegment.selectedSegmentIndex {
        case 0:
             newResult = "+"
        case 1:
            newResult = "-"
        case 2:
            newResult = "*"
        case 3:
            newResult = "/"
        default:
            print("no segment selected")
        
         }
       }
    
    @IBAction func calcButton(_ sender: Any) {
        let num1 = Int(number1.text!)
        let num2 = Int(number2.text!)        
        switch newResult {
        case "+":
            result.text = num1 == nil || num2 == nil ?   "please enter number" :  String(num1! + num2!)
        case "-":
            result.text = num1 == nil || num2 == nil ?   "please enter number" :  String(num1! - num2!)
        case "*":
            result.text = num1 == nil || num2 == nil ?   "please enter number" :  String(num1! * num2!)
        case "/":
            if num2 == 0 {
                result.text = "can't divide to 0"
            } else {
                result.text = num1 == nil || num2 == nil ?   "please enter number" :  String(num1! / num2!)
            }
        default:
            result.text = "choose one of them above"
        }
    }
    
    @IBAction func controlLabelFontSize(_ sender: UISlider) {
      self.result.font = result.font.withSize(CGFloat(Int(sender.value)))

    }
    
}
