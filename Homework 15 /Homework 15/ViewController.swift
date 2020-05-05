//
//  ViewController.swift
//  Homework 15
//
//  Created by Luka Alimbarashvili on 5/5/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var firstPageImage: UIImageView!
    @IBOutlet weak var FirstPageCollectionView: UICollectionView!
    
    var firstArray = ["bmw", "breakingbad", "dog"]
    var names = ["Cars", "Movies", "Animals"]
    var imageCollection = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        FirstPageCollectionView.dataSource = self
        FirstPageCollectionView.delegate = self
        
        firstPageImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        firstPageImage.addGestureRecognizer(tapGesture)
    }
    
    func alert(title:String, message: String)  {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
         self.present(alert, animated: true)
     }

    @objc func tapGesture () {
        if firstPageImage.image == UIImage(named: "bmw") {
            imageCollection = "bmw"
        } else if firstPageImage.image == UIImage(named: "breakingbad") {
            imageCollection = "breakingbad"
        } else if firstPageImage.image == UIImage(named: "dog") {
            imageCollection = "dog"
        } else {
            alert(title: "Warning", message: "Pick a Photo")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(withIdentifier: "segueGoesHere") as! SecondViewController
        VC.photosAbout = imageCollection
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
  
}




extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "first_cell", for: indexPath) as! FirstPageCell

        cell.nameLabel.text = names[indexPath.row]
        cell.imageView.image = UIImage(named: firstArray[indexPath.row])
        return cell
    }
}



extension ViewController:  UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let cell = collectionView.cellForItem(at: indexPath) as? FirstPageCell
        firstPageImage.image = UIImage(named: firstArray[indexPath.row])
    }
}
  
