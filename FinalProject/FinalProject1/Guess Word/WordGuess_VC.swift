//
//  WordGuess_VC.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 7/8/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import ShimmerBlocks

class WordGuess_VC: UIViewController {
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playerGuess: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var mainStachView: UIStackView!
    //
    
    //    var isLoaded = false
    
    private lazy var shimmerContainer = ShimmerContainer(parentView: mainStachView)
    
    private lazy var shimmerData: [ShimmerData] = {
        return [ShimmerData(image1, matchViewDimensions: true),
                ShimmerData(image2, matchViewDimensions: true),
                ShimmerData(image3, matchViewDimensions: true),
                ShimmerData(image4, matchViewDimensions: true)]
    }()
    
    func isLoading(_ loading: Bool) {
        shimmerContainer.applyShimmer(enable: loading, with: shimmerData)
    }
    
    
    //
    var reponse = APIResponse()
    var objectIndex = 0
    
    var allWord = [WordObjects]() {
        didSet {
            
            changeImages(objectsIndex: objectIndex)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 10
        mainLabel.isHidden = true
        
        reponse.getBands { (words) in
            self.allWord = words.words
        }
        
    }
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        mainLabel.isHidden = false
        
        
        if objectIndex < 5 {
            if objectIndex == 0 {
                if playerGuess.text == "animal" {
                    mainLabel.text = "Congratulations !"
                    mainLabel.textColor = .green
                    scoreLabel.text = "Score : 1"
                    objectIndex += 1
                    changeImages(objectsIndex: objectIndex)
                }else {
                    mainLabel.text = "Oops Wrong answer! Try again!"
                    mainLabel.textColor = .red
                }
            } else if objectIndex == 1 {
                if playerGuess.text == "think" {
                    mainLabel.text = "Congratulations !"
                    mainLabel.textColor = .green
                    scoreLabel.text = "Score : 2"
                    objectIndex += 1
                    changeImages(objectsIndex: objectIndex)
                }else {
                    mainLabel.text = "Oops Wrong answer! Try again!"
                    mainLabel.textColor = .red
                }
            } else if objectIndex == 2 {
                if playerGuess.text == "cold" {
                    mainLabel.text = "Congratulations !"
                    mainLabel.textColor = .green
                    scoreLabel.text = "Score : 3"
                    objectIndex += 1
                    changeImages(objectsIndex: objectIndex)
                }else {
                    mainLabel.text = "Oops Wrong answer! Try again!"
                    mainLabel.textColor = .red
                }
            } else if objectIndex == 3 {
                if playerGuess.text == "bow" {
                    mainLabel.text = "Congratulations !"
                    mainLabel.textColor = .green
                    scoreLabel.text = "Score : 4"
                    alert(title: "yeeey", message: "congadulations")
                    objectIndex = 0
                    changeImages(objectsIndex: objectIndex)
                } else {
                    mainLabel.text = "Oops Wrong answer! Try again!"
                    mainLabel.textColor = .red
                }
            }
        }
        
        playerGuess.text = ""
        
    }
    
    func changeImages(objectsIndex: Int) {
        DispatchQueue.main.async {
            self.isLoading(true)
        }
        
        
        self.allWord[objectsIndex].image1.downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                self.image1.image = image
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isLoading(false)
                    self.mainLabel.isHidden = true
                }
            }
        })
        self.allWord[objectsIndex].image2.downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                self.image2.image = image
            }
        })
        self.allWord[objectsIndex].image3.downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                self.image3.image = image
            }
        })
        self.allWord[objectsIndex].image4.downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                self.image4.image = image
            }
        })
    }
    
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: { (oke) in
            self.scoreLabel.text = "Score : 0"
            self.mainLabel.isHidden = true
        }))
        self.present(alert, animated: true)
    }
    
}
