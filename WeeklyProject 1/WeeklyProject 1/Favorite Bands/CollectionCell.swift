//
//  CollectionCell.swift
//  WeeklyProject 1
//
//  Created by Luka Alimbarashvili on 5/25/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var imageView: UIImageView!


    func flipUp(speed:TimeInterval = 0.3) {
        UIView.transition(from: imageView, to: infoView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
    }
    func flipDown(speed:TimeInterval = 0.3) {
        UIView.transition(from: infoView, to: imageView, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
    }

    
}
