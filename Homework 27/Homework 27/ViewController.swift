//
//  ViewController.swift
//  Homework 27
//
//  Created by Luka Alimbarashvili on 5/25/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var calcButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButtonOnTapped(_ sender: Any) {
         ChangeButton(isEnabled: false, text: "Calculating ...", color: .gray)
         goToBackground()
    }
    
    
    func goToBackground() {
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "Wait for button")
        
        queue.async(group: group) {
            self.IsPrime(value: 100000)
        }
        
        group.notify(queue: .main) {
            self.ChangeButton(isEnabled: true, text: "Calculate Prime Numbers Again", color: .systemGreen)
        }
    }
    
    
    
    func IsPrime(value: Int) {
        for i in 2 ..< value {
            
            var isPrime = true
            var j = 2
            while j < i {
                if i % j == 0 {
                    isPrime = false
                }
                j += 1
            }
            
            if isPrime {
                print(i)
            }
        }
    }
    
    func ChangeButton(isEnabled: Bool, text: String, color:UIColor) {
        self.calcButton.isEnabled = isEnabled
        self.calcButton.setTitle("\(text)", for: .normal)
        self.calcButton.backgroundColor = color
    }
    
}

