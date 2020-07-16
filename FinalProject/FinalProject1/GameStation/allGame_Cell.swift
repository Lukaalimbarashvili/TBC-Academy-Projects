//
//  allGame_Cell.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 7/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class allGame_Cell: UICollectionViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    
    var tempGame : gameInfo? {
          didSet {
              gameName.text = tempGame?.name
              mainImageView.image = tempGame!.image
              gameDescription.text = tempGame?.description
          }
      }
    
}
