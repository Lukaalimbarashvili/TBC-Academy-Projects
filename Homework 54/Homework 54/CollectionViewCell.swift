//
//  CollectionViewCell.swift
//  Homework 54
//
//  Created by Luka Alimbarashvili on 7/4/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import ShimmerBlocks

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var isLoaded = false
    
    private lazy var shimmerContainer = ShimmerContainer(parentView: self)
    
    private lazy var shimmerData: [ShimmerData] = {
           return [ShimmerData(mainImageView, matchViewDimensions: true),
                   ShimmerData(name, matchViewDimensions: true)]
       }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func isLoading(_ loading: Bool) {
        shimmerContainer.applyShimmer(enable: loading, with: shimmerData)
    }
}
