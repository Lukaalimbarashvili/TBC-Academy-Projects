//
//  SoundsManager.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/24/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        case click
        case win
        case lost
    }
    func playSound(effect:SoundEffect) {
        var soundsFilename = ""
        
        switch effect {
            case .click:
                soundsFilename = "click"
            case .win:
                soundsFilename = "win"
            case .lost:
                soundsFilename = "lose"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundsFilename, ofType: ".wav")
        
        guard bundlePath != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("No sounds")
            return
        }
      
    }
    
}
