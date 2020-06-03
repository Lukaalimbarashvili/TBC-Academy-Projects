//
//  ViewController.swift
//  Homework 33
//
//  Created by Luka Alimbarashvili on 6/3/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSquare()
    }
    
    func drawSquare() {
        let renderer =  UIGraphicsImageRenderer(size: CGSize(width: 300, height: 150))
        
        
        let image = renderer.image { (ctx) in
            let square = CGRect(x: 0, y: 0, width: 300, height: 150)
            
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.systemTeal.cgColor)
            ctx.cgContext.setLineWidth(30)
            
            
            ctx.cgContext.addRect(square)
            ctx.cgContext.drawPath(using: .fillStroke)
    }
        imageView.image = image

}

}
