//
//  CarsCell.swift
//  Homework 13
//
//  Created by Luka Alimbarashvili on 5/1/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class CarsCell: UITableViewCell {

    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
