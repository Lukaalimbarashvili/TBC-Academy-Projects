//
//  TrendingButtonCell.swift
//  Lecture46
//
//  Created by Luka Alimbarashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TrendingButtonCell: UICollectionViewCell {

    @IBOutlet weak var buttonName: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonName.layer.cornerRadius = 5
    }

}
