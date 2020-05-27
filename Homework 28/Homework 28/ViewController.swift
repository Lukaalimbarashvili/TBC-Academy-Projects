//
//  ViewController.swift
//  Homework 28
//
//  Created by Luka Alimbarashvili on 5/27/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var tableInfo = ["Castle","Knight","Map","Viking","Medusa","Reaper"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TABLECELL_ID", for: indexPath) as! TableViewCell
        cell.mainImage.image = UIImage(named: tableInfo[indexPath.row])
        cell.nameLabel.text = tableInfo[indexPath.row]
        return cell
    }
    
    
    
}


extension ViewController:UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        makeFancyAnimation(index: indexPath.row)
    }
    
}


extension ViewController {
    
    func makeFancyAnimation(index: Int) {

                let x = view.frame.width / 2 - 50
                let y = view.frame.height + 50
                let tempImage = UIImageView(frame: CGRect(x: x, y: y, width: 100, height: 100))
        
        tempImage.backgroundColor = .tertiaryLabel 
                tempImage.layer.cornerRadius = 10
        
        
                self.view.addSubview(tempImage)
                
                tempImage.image = UIImage(named: tableInfo[index])
        
                
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
            tempImage.frame.origin.y = y - 300
        }) { (opa) in
            UIView.transition(with: tempImage, duration: 1, options: .transitionFlipFromTop, animations: {
                tempImage.alpha = 0
            })
        }
        
    }
}


