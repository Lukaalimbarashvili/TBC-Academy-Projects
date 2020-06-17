//
//  CollectionViewCell.swift
//  Homework 34
//
//  Created by Luka Alimbarashvili on 6/17/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var viewcontroller: UIViewController?
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
    }
}
