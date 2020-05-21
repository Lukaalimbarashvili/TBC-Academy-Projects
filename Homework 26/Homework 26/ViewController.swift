//
//  ViewController.swift
//  Homework 26
//
//  Created by Luka Alimbarashvili on 5/21/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit


//let lightNotificationKey = "light"
//let darkNotificationKey = "dark"


class ViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height / 2
        createObserver()
    }
    
    
    func createObserver() {
        
        //Light
        NotificationCenter.default.addObserver(self , selector: #selector(self.updateMainView(notification:)), name: .lightNotificationKey, object: nil)
        
        //Dark
        NotificationCenter.default.addObserver(self , selector: #selector(self.updateMainView(notification:)), name: .darkNotificationKey, object: nil)

    }
    @objc func updateMainView(notification: NSNotification) {
        let isLight = notification.name == NSNotification.Name.lightNotificationKey
        
        let image = isLight ? UIImage(named: "luke")! : UIImage(named: "vader")!
        let name = isLight ? "Luke Skywalker" : "Darth Vader"
        let color = isLight ? UIColor.cyan : UIColor.red
        
        mainImageView.image = image
        nameLabel.text = name
        view.backgroundColor = color
    }
  
    @IBAction func onChooseButton(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        present(selectionVC,animated: true, completion: nil)
    }
}

extension NSNotification.Name {
    static let lightNotificationKey = NSNotification.Name("light")
    static let darkNotificationKey = NSNotification.Name("dark")
}
