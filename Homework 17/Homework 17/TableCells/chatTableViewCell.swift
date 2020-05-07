//
//  chatTableViewCell.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class chatTableViewCell: UITableViewCell {

    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var chatName: UILabel!
    @IBOutlet weak var chatMessage: UILabel!
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
