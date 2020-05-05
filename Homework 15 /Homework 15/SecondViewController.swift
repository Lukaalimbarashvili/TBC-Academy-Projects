//
//  SecondViewController.swift
//  Homework 15
//
//  Created by Luka Alimbarashvili on 5/5/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var SecondPageCollectionView: UICollectionView!
    
    
    let cars = ["bmw","porsche","toyota","ferrari"]
    let animals = ["giraffe","frog","dog","cat"]
    let movies = ["batman","interstellar","fightclub","breakingbad"]
    var photosAbout = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SET TITLE
        if photosAbout == "bmw" {
            self.title = "Cars"
        } else if photosAbout == "breakingbad" {
            self.title = "Movies"
        } else if photosAbout == "dog"{
            self.title = "Animals"
        }
        
        SecondPageCollectionView.delegate = self
        SecondPageCollectionView.dataSource = self
        
        SecondPageCollectionView.register(UINib(nibName: "Second_Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "demo")

    }
    

}



extension SecondViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "demo", for: indexPath) as! Second_Cell

        if photosAbout == "bmw" {
            cell.secondPageImage.image = UIImage(named: cars[indexPath.row])
        } else if photosAbout == "breakingbad" {
            cell.secondPageImage.image = UIImage(named: movies[indexPath.row])
        } else if photosAbout == "dog"{
            cell.secondPageImage.image = UIImage(named: animals[indexPath.row])
        }
        cell.backgroundColor = .darkGray
        return cell
    }
    
}



extension SecondViewController:  UICollectionViewDelegate {
}
  
extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth =  collectionView.frame.width / 2
        let itemHeight = collectionView.frame.height / 2
        
        return CGSize(width: itemWidth - 20 - 20, height: itemHeight - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:30, left: 20, bottom: 10, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}
