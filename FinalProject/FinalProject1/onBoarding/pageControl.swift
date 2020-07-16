//
//  pageControl.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 7/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class QuadPageControl: UIPageControl {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !subviews.isEmpty else { return }
        
        let spacing: CGFloat = 15
        
        let width: CGFloat = 15
        
        let height = spacing
        
        var total: CGFloat = 0
        
        for view in subviews {
            view.layer.cornerRadius = 5
            view.frame = CGRect(x: total, y: frame.size.height / 2 - height / 2, width: 20, height: 10)
            total += width + spacing
        }
        
        total -= spacing
        
        frame.origin.x = frame.origin.x + frame.size.width / 2 - total / 2
        frame.size.width = total
    }
}
