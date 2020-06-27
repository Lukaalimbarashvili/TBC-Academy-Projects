//
//  ViewController.swift
//  Homework 47
//
//  Created by Luka Alimbarashvili on 6/28/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {

    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    
    var selectedImageView: UIImageView?
    
    let animation = AnimationController()
    
    var tempImage: String?
    let images = ["fightclub","inception","ironman"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    
    @IBAction func firstImageTapped(_ sender: UITapGestureRecognizer) {
        performTransition(image: firstImageView, index: 0)
    }
    
    @IBAction func secondImageTapped(_ sender: UITapGestureRecognizer) {
        performTransition(image: secondImageView, index: 1)
    }
    
    @IBAction func thirdImageTapped(_ sender: Any) {
        performTransition(image: thirdImageView, index: 2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! AnimatedViewController
        destinationVC.transitioningDelegate = self
        destinationVC.modalPresentationStyle = .custom
        destinationVC.image = tempImage
       }
    
    func performTransition(image: UIImageView, index: Int) {
        selectedImageView = image
        tempImage = images[index]
        performSegue(withIdentifier: "animatedSegue", sender: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animation.transitionMode = .present
        animation.startingPoint = CGPoint(x: selectedImageView!.frame.minX, y: view.bounds.maxY)
        return animation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animation.transitionMode = .dismiss
        return animation
    }
    

}
