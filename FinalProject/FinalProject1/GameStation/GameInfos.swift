//
//  GameInfos.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/24/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation
import UIKit


struct gameInfo {
    let image       :UIImage
    let name        :String
    let description :String
}


let drawing  = gameInfo(image: #imageLiteral(resourceName: "draw_ic"), name: "Drawing Area", description: "Place where you can draw anything you want, its full with great features")
let flipCard = gameInfo(image: #imageLiteral(resourceName: "flipCard_ic"), name: "FlipCard Game", description: "Player mission is to flip cards and match them, which than will dissapear, but hurry up there is time limit !")
let Baccara =  gameInfo(image: #imageLiteral(resourceName: "logo"), name: "Baccara", description: "It's game against computer, Your mission is to get higher card than computer, Chances are 50 - 50")
let wordguess = gameInfo(image: #imageLiteral(resourceName: "game4"), name: "Guess the Word", description: "When game starts You will see 4 picture and your mission is to guess the word which is related to all of them")
let map = gameInfo(image: #imageLiteral(resourceName: "map"), name: "Map", description: "just map")

let myGames = [drawing,Baccara,flipCard,wordguess,map]
