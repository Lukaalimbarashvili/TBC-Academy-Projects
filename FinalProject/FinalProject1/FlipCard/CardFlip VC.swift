//
//  CardFlip VC.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/24/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class CardFlip_VC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timerLabel: UILabel!
    

       let model = CardModel()
       var cardsArray = [Card] ()
       
       var timer:Timer?
       var milliseconds:Int = 1000 * 100
       
       var firstFlippedCardIndex: IndexPath?
       
       var soundPlayer:SoundManager = SoundManager()
       
       override func viewDidLoad() {
           super.viewDidLoad()
        
           let value = UIInterfaceOrientation.landscapeLeft.rawValue
           UIDevice.current.setValue(value, forKey: "orientation")
        
           cardsArray = model.getCards()
           
           // Initialize the timer
           timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
           RunLoop.main.add(timer!, forMode: .common )
           
           
       }

        
    
    @IBAction func OnBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
       
       // MARK: - Timer methods
       
       @objc func timerFired() {

           milliseconds -= 1

           let seconds:Double = Double(milliseconds)/1000.0
           timerLabel.text = String(format: "Time Remaining: %.2f", seconds)

           if milliseconds == 0 {
               timerLabel.textColor = UIColor.red
               timer?.invalidate()

           }
           checkForGameEnd()
       }
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return cardsArray.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardFlipCellIds.flipCard, for: indexPath) as! CardCollectionViewCell
           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            let cardCell = cell as? CardCollectionViewCell
            let card =  cardsArray[indexPath.row]
            cardCell?.configureCell(card: card)
       }
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
           if milliseconds <= 0 {
               return
           }
           
           let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
           
           if cell?.card?.isFlipped == false && cell?.card?.isMatched == false{
               cell?.flipUp()
               
               soundPlayer.playSound(effect: .click)
               
               if firstFlippedCardIndex == nil {
                   firstFlippedCardIndex = indexPath
               }
               else {
                   checkForMatch(indexPath)
               }
           }
       }
         
       
       // MARK: - Game Logic Methods
       
       func checkForMatch(_ secondFlippedCarIndex: IndexPath) {
        
           let cardOne = cardsArray[firstFlippedCardIndex!.row]
           let cardTwo = cardsArray[secondFlippedCarIndex.row]
           
           let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
           let cardTwoCell = collectionView.cellForItem(at: secondFlippedCarIndex)  as? CardCollectionViewCell
           
           if cardOne.imageName == cardTwo.imageName {
               
               cardOne.isMatched = true
               cardTwo.isMatched = true
               
               cardOneCell?.remove()
               cardTwoCell?.remove()
               
               checkForGameEnd()

           }
           else {
                soundPlayer.playSound(effect: .click)
               
               cardOne.isFlipped = false
               cardTwo.isFlipped = false
               
               cardOneCell?.flipDown()
               cardTwoCell?.flipDown()
           }
           
           firstFlippedCardIndex = nil
       }
       
       func checkForGameEnd() {
           
           var hasWon = true
           
           for card in cardsArray {
               if card.isMatched == false {
                   hasWon = false
                   break
               }
           }
           
           if hasWon {
               showAlert(title: "Congratulations", message: "You have won the game !")
               soundPlayer.playSound(effect: .click)
            self.navigationController?.popViewController(animated:true)
               
           } else {
               if milliseconds <= 0 {
                   soundPlayer.playSound(effect: .lost)
                   showAlert(title: "Time's Up", message: "Sorry better luck Next time !")
               }
           }
       }
       
       func showAlert(title:String, message:String) {
           
           let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
           
           let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
           
           alert.addAction(okAction)
           
           present(alert,animated: true,completion: nil)
       }


}
