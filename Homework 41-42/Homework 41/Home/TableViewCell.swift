//
//  TableViewCell.swift
//  Homework 41
//
//  Created by Luka Alimbarashvili on 6/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import Localize

class TableViewCell: UITableViewCell {


    @IBOutlet weak var coffeImage: UIImageView!
    @IBOutlet weak var coffeeName: UILabel?
    
    
    var coffe: String? {
        didSet {
            coffeImage.image = UIImage(named: coffe!)
        }
    }
    
    var tempCoffeeName: String? {
        didSet {
            coffeeName?.text = tempCoffeeName!.localized
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
