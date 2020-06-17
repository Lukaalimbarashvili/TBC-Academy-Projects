//
//  DetailsCell.swift
//  Homework 34
//
//  Created by Luka Alimbarashvili on 6/17/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet weak var champAbility: UILabel!
    
    
    var tempAbility: String? {
        didSet {
            champAbility.text = tempAbility
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
