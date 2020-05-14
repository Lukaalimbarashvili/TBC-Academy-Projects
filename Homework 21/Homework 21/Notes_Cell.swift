//
//  Notes_Cell.swift
//  Homework 21
//
//  Created by Luka Alimbarashvili on 5/14/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Notes_Cell: UITableViewCell {

    @IBOutlet weak var cell_Notes: UILabel!
    
    var tempNote: Notes! {
        didSet {
            cell_Notes.text = tempNote.note
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
