
import UIKit

class toto: UIViewController {

     let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let center = view.center
        
        // Shadow
        
//        let trackLayer = CAShapeLayer()
//
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
//
//        trackLayer.path = circularPath.cgPath
//
//        trackLayer.strokeColor = UIColor.systemGray5.cgColor
//        trackLayer.lineWidth = 15
//        trackLayer.fillColor = UIColor.clear.cgColor
//        trackLayer.lineCap = .round
//
//        view.layer.addSublayer(trackLayer)
        
        // Real
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
//        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        //
        
        
        
        let ball = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 20, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)

        let ballShapeLayer = CAShapeLayer()
        ballShapeLayer.path = ball.cgPath

        ballShapeLayer.fillColor = UIColor.red.cgColor

        shapeLayer.addSublayer(ballShapeLayer)
        //

//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    
    }
    
//    @objc private func handleTap() {
//
//        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//
//        basicAnimation.toValue = 1
//        basicAnimation.duration = 2
//
//        basicAnimation.fillMode = .forwards
//        basicAnimation.isRemovedOnCompletion = false
//
//        shapeLayer.add(basicAnimation, forKey: "Basic")
//
//    }


}

