//
//  TableViewCell.swift
//  Homework 28
//
//  Created by Luka Alimbarashvili on 5/27/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

 
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
