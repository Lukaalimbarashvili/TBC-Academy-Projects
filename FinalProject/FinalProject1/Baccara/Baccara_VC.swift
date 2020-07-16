//
//  Baccara_VC.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 7/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Baccara_VC: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    var winner = "WIN"
    
     var soundPlayer:SoundManager = SoundManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dealTapped(_ sender: Any) {
        
        soundPlayer.playSound(effect: .click)
        
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        leftImageView.image = UIImage(named: "card\(leftNumber) game2")
        rightImageView.image = UIImage(named: "card\(rightNumber) game2")
        
        
        if leftNumber == rightNumber {
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
            winner = "TIE"
        } else if leftNumber > rightNumber {
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
            winner = "WIN"
        }
        else if leftNumber < rightNumber {
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
            winner = "LOST"
        }
        
        save(player: "\(leftNumber)", computer: "\(rightNumber)", winner: winner)
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onHistory(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Baccara", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "baccaraHistory")
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    func save(player: String, computer: String, winner: String) {
        let context = AppDelegate.coreDataContainer.viewContext
        let newData = BaccaraHistory(context: context)
    
        newData.playerCard = player
        newData.computerCard = computer
        newData.winner = winner
    
        do {
            try context.save()
        } catch {}
     }
    

}


