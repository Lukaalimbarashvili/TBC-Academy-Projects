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
    
    @IBOutlet weak var addItemView: UIView!
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var selectItemLabel: UILabel!
    @IBOutlet weak var castleImage: UIImageView!
    @IBOutlet weak var knightImage: UIImageView!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var medusaImage: UIImageView!
    @IBOutlet weak var reaperImage: UIImageView!
    @IBOutlet weak var vikingImage: UIImageView!
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    var tableInfo = ["Castle","Knight","Medusa"]
    
    var alreadyTapped = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewHeight.constant = 100
        selectItemLabel.isHidden = true
        castleImage.isHidden = true
        knightImage.isHidden = true
        mapImage.isHidden = true
        medusaImage.isHidden = true
        reaperImage.isHidden = true
        vikingImage.isHidden = true
    }
    @IBAction func addImageTap(_ sender: UITapGestureRecognizer) {
        
        
        if alreadyTapped {
            UIView.transition(with: addItemView, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.viewHeight.constant = 100
                self.addImage.transform = CGAffineTransform(rotationAngle: 0)
            })
            self.selectItemLabel.isHidden = true
            alreadyTapped = false

        } else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
                self.selectItemLabel.frame.origin.y = 100
                self.addImage.frame.origin.x = 300
                self.tableView.frame.origin.y = 200
                self.addImage.transform = CGAffineTransform(rotationAngle: 0.8)
            })
                 self.viewHeight.constant = 170
                 self.selectItemLabel.isHidden = false
                 self.castleImage.isHidden = false
                 self.knightImage.isHidden = false
                 self.mapImage.isHidden = false
                 self.medusaImage.isHidden = false
                 self.reaperImage.isHidden = false
                 self.vikingImage.isHidden = false
            
                 alreadyTapped = true
        }

      
    }
 
    @IBAction func castleImageTap(_ sender: UITapGestureRecognizer) {
        forAddImage(imgName: "Castle")
    }
    @IBAction func knightImageTap(_ sender: UITapGestureRecognizer) {
        forAddImage(imgName: "Knight")
    }
    
    @IBAction func mapImageTap(_ sender: UITapGestureRecognizer) {
        forAddImage(imgName: "Map")
    }
    
    @IBAction func medusaImageTap(_ sender: UITapGestureRecognizer) {
        forAddImage(imgName: "Medusa")
    }
    
    @IBAction func reaperImageTap(_ sender: UITapGestureRecognizer) {
        forAddImage(imgName: "Reaper")
    }
    
    @IBAction func vikingImageTap(_ sender: UITapGestureRecognizer) {
        forAddImage(imgName: "Viking")
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



extension ViewController {
    func forAddImage(imgName: String) {
        tableInfo.append("\(imgName)")
        tableView.reloadData()
        selectItemLabel.isHidden = true
        alreadyTapped = false
        
        UIView.transition(with: addItemView, duration: 0.5, options: .transitionFlipFromTop, animations: {
            self.viewHeight.constant = 100
            self.addImage.transform = CGAffineTransform(rotationAngle: 0)
        })
    }
}


