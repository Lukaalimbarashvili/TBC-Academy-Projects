//
//  CardModel.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/24/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

import Foundation

class CardModel {
    func getCards() -> [Card] {
        
        var generatedNumber = [Int]()
        var generatedCards = [Card]()
        
        while generatedNumber.count < 8 {
             
                let randomNumber = Int.random(in: 1...13)
            
                if generatedNumber.contains(randomNumber) == false {
            
                let cardOne = Card()
                let cardTwo = Card()
                
          
                cardOne.imageName = "card\(randomNumber)"
                cardTwo.imageName = "card\(randomNumber)"

              
                generatedCards += [cardOne,cardTwo]
                
                generatedNumber.append(randomNumber)
            
            }
            
        }
        
        generatedCards.shuffle()
        
        // Return array
        return generatedCards
    }
    
}

