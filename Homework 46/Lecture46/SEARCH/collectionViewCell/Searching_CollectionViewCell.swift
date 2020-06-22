//
//  Searching_CollectionViewCell.swift
//  Lecture46
//
//  Created by Luka Alimbarashvili on 6/23/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class Searching_CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 15
    }

}
