//
//  Character_Cell.swift
//  Homework 35
//
//  Created by Luka Alimbarashvili on 6/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import ShimmerSwift

class Character_Cell: UITableViewCell {
    
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var species: UILabel!
    

    
    
    var tempImage: String? {
        didSet {
            charImage.downloaded(from: tempImage!)
        }
    }
    
    var tempStatus: String? {
        didSet {
            status.text = tempStatus
                        
            switch tempStatus {
            case "Dead":
                status.textColor = .red
            case "Alive":
                status.textColor = .green
            default:
                status.textColor = .gray
            }
        }
    }
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
