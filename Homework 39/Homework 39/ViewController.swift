//
//  ViewController.swift
//  Homework 39
//
//  Created by Luka Alimbarashvili on 6/11/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        alert(message: "ორი ხე ტყეაა ?")
    }

    
    func alert(message: String)  {
            let alert = UIAlertController(title: "\n\n", message: message, preferredStyle: .alert)
             
            alert.addAction(UIAlertAction(title: "კი ჩემო ძმაო", style: .default, handler: { (action) in
                self.imageView.isHidden = false
                self.label.text = "მართალია ჩემო ძმაო"
            }))
        
            alert.addAction(UIAlertAction(title: "არა ბუჩქია", style: .default, handler: { (action) in
               self.imageView.isHidden = false
               self.label.text = "კაი რას იძაღი"
            }))

            
            let img = UIImage(named: "exclamation_mark")
            let imageView = UIImageView(frame: CGRect(x: 120, y: 10, width: 40, height: 40))
            imageView.image = img

            alert.view.addSubview(imageView)

            self.present(alert, animated: true)
        }
    
    
    

}

