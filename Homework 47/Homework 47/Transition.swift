import UIKit

enum viewTransitionMode {
    case present, pop, dismiss
}

class AnimationController: NSObject {
    
    var startingPoint = CGPoint.zero
    
    var transitionMode : viewTransitionMode = .present
    
}

extension AnimationController :UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewCenter = presentedView.center
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: 0.4, animations: {
                    presentedView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                    
                }, completion: { (success:Bool) in
                    UIView.animate(withDuration: 0.2, animations: {
                        presentedView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                    }) { (done) in
                        UIView.animate(withDuration: 0.2, animations: {
                            presentedView.transform = CGAffineTransform(scaleX: 1, y: 1)
                        })
                        
                    }
                    
                    
                    transitionContext.completeTransition(success)
                })
            }
            
        }
        else{
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            
            if let returningView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returningView.center
                
                UIView.animate(withDuration: 0.1, animations: {
                    returningView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                    
                }, completion: { (success:Bool) in
                    UIView.animate(withDuration: 0.2, animations: {
                        returningView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                    }) { (f) in
                        UIView.animate(withDuration: 0.2, animations: {
                            returningView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                        })  { (f) in
                            UIView.animate(withDuration: 0.4, animations: {
                                returningView.center = self.startingPoint
                                returningView.alpha = 0
                                
                            }) { (success:Bool) in
                                returningView.center = viewCenter
                                returningView.removeFromSuperview()
                                
                                transitionContext.completeTransition(success)
                            }
                        }
                    }
                })
            }
        }
    }
}

