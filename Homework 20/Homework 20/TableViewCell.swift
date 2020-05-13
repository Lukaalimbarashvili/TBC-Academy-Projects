//
//  TableViewCell.swift
//  Homework 20
//
//  Created by Luka Alimbarashvili on 5/13/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var finalTopic: UILabel!
    @IBOutlet weak var finalAbout: UILabel!
    @IBOutlet weak var finalDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
