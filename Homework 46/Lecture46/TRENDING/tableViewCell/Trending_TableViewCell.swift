//
//  Trending_TableViewCell.swift
//  Lecture46
//
//  Created by Luka Alimbarashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class Trending_TableViewCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artist: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
