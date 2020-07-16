//
//  BaccaraHistoryCell.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 7/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class BaccaraHistoryCell: UITableViewCell {
    
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var winLoseLabel: UILabel!
    
    var tempGame: BaccaraHistory? {
        
        didSet {
           DispatchQueue.main.async {
            self.playerImage?.image = UIImage(named: "card\(self.tempGame!.playerCard!) game2")
            self.computerImage?.image = UIImage(named: "card\(self.tempGame!.computerCard!) game2")
            self.winLoseLabel?.text = self.tempGame?.winner
            
            if self.tempGame?.winner == "WIN" {
                self.winLoseLabel.textColor = .green
            } else if self.tempGame?.winner == "LOST"  {
                self.winLoseLabel.textColor = .red
            } else {
                self.winLoseLabel.textColor = .gray
            }
            
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
