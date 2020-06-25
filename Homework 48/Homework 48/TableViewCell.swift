//
//  TableViewCell.swift
//  Homework 48
//
//  Created by Luka Alimbarashvili on 6/24/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var tapForDetail: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    
    var tempMovie : movie? {
        didSet {
            mainImageView.image   = tempMovie?.image
            movieName.text        = tempMovie?.name
            movieDescription.text = tempMovie?.description
        }
    }
    
    var DissapearTapForDetailLabel: Bool? {
        
        didSet {
            if DissapearTapForDetailLabel! {
                tapForDetail.isHidden = true
            } else {
                tapForDetail.isHidden = false
            }
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
