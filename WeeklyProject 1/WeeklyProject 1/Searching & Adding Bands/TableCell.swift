//
//  TableCell.swift
//  WeeklyProject 1
//
//  Created by Luka Alimbarashvili on 5/25/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var bandName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
