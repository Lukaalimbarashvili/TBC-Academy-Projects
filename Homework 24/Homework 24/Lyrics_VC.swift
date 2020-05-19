//
//  Lyrics_VC.swift
//  Homework 24
//
//  Created by Luka Alimbarashvili on 5/19/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Lyrics_VC: UIViewController {

    @IBOutlet weak var songLyrics: UILabel!
    
    
    var bandName = ""
    var songName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSongLyrics(artist: bandName, title: songName)
    }
    override func viewWillDisappear(_ animated: Bool) {
        bandName = ""
        songName = ""
    }
    // mettalica - battery,confusion  queen - Bijou,jesus
    func getSongLyrics(artist:String, title:String) {
        guard let url = URL(string: "https://api.lyrics.ovh/v1/\(artist)/\(title)") else {return songLyrics.text = "No Lyrics Found"}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let unwrappedData = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let templyrics = try decoder.decode(SongLyrics.self, from: unwrappedData)
                DispatchQueue.main.async {
                    self.songLyrics.text = templyrics.lyrics
                }
            } catch {print(error.localizedDescription)
            }
       
        }.resume()
    }
}

