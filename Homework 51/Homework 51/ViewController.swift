//
//  ViewController.swift
//  Homework 51
//
//  Created by Luka Alimbarashvili on 6/30/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    let layer = CAShapeLayer()
    let backDropLayer = CAShapeLayer()
    let ballIndicator = CAShapeLayer()
    
    
    var midViewX = CGFloat()
    var midViewY = CGFloat()
    
    var circlePath2 = UIBezierPath()
    var shapeLayer2 = CAShapeLayer()
    
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        midViewX = view.frame.midX
        midViewY = view.frame.midY
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: midViewX,y: midViewY), radius: CGFloat(100), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
        shapeLayer.lineWidth = 35
        view.layer.addSublayer(shapeLayer)
        
        let angleEarth: Double = 180
        let angleEarthAfterCalculate: CGFloat = CGFloat(angleEarth*Double.pi/180) - CGFloat(Double.pi/2)
        let earthX = midViewX + cos(angleEarthAfterCalculate)*100
        let earthY = midViewY + sin(angleEarthAfterCalculate)*100
        circlePath2 = UIBezierPath(arcCenter: CGPoint(x: earthX,y: earthY), radius: CGFloat(14), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        shapeLayer2.path = circlePath2.cgPath
        shapeLayer2.fillColor = UIColor.black.cgColor
        shapeLayer2.strokeColor = UIColor.clear.cgColor
        shapeLayer2.lineWidth = 7
        view.layer.addSublayer(shapeLayer2)

        let dragBall = UIPanGestureRecognizer(target: self, action:#selector(dragBall(recognizer:)))
        view.addGestureRecognizer(dragBall)
        
        
    }
    
    @objc func dragBall(recognizer: UIPanGestureRecognizer) {
        let point = recognizer.location(in: self.view);
        let earthX = Double(point.x)
        let earthY = Double(point.y)
        let midViewXDouble = Double(midViewX)
        let midViewYDouble = Double(midViewY)
        let angleX = (earthX - midViewXDouble)
        let angleY = (earthY - midViewYDouble)
        let angle = atan2(angleY, angleX)
        let earthX2 = midViewXDouble + cos(angle)*100
        let earthY2 = midViewYDouble + sin(angle)*100
        circlePath2 = UIBezierPath(arcCenter: CGPoint(x: earthX2,y: earthY2), radius: CGFloat(14), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        shapeLayer2.path = circlePath2.cgPath
        
        percentageLabel.text = "\(Int(counter))%"
        
        counter += 0.8
    }
    
}






