//
//  Table_Cell.swift
//  Homework 24
//
//  Created by Luka Alimbarashvili on 5/19/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Table_Cell: UITableViewCell {

    @IBOutlet weak var SongName: UILabel!
    
    var tempName = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        SongName.text = tempName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
