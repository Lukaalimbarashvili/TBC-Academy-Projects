//
//  ViewController.swift
//  Homework 53
//
//  Created by Luka Alimbarashvili on 7/1/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let character = [pic1,pic2,pic3,pic4,pic5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.showsVerticalScrollIndicator = false
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }


}


extension ViewController: UICollectionViewDataSource, PinterestLayoutDelegate {
  
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return character.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card_id", for: indexPath) as? CollectionViewCell {
            cell.imageView.image = UIImage(named: character[indexPath.row].image)
            cell.clipsToBounds = true
            cell.layer.cornerRadius = 15
            cell.imageView.contentMode = .scaleAspectFill
            cell.imageInfo.text = character[indexPath.row].description
            cell.backgroundColor = .red
              return cell
        }
        
      
        return UICollectionViewCell()

        
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = UIImage(named: character[indexPath.row].image)
        
          if let height = image?.size.height {
            return height 
         }
        
        return 0.0
      }
    
    
}

