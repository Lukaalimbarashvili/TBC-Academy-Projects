//
//  CallsTableViewCell.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class CallsTableViewCell: UITableViewCell {

    @IBOutlet weak var numberCell: UILabel!
    @IBOutlet weak var countryCell: UILabel!
    @IBOutlet weak var dateCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
