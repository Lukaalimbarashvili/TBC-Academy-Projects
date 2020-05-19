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
    var temp = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSongLyrics(artist: bandName, title: songName)
    }
    override func viewWillDisappear(_ animated: Bool) {
        bandName = ""
        songName = ""
    }
    func getSongLyrics(artist:String, title:String) {

        var tempArtist = artist.replacingOccurrences(of: " ", with: "%20")
        var tempTitle = title.replacingOccurrences(of: " ", with: "%20")
        
        
        // Parse Artist
        if let i = tempArtist.firstIndex(of: "/") {
            tempArtist.remove(at: i)
        } else if let j = tempArtist.firstIndex(of: "'") {
            tempArtist.remove(at: j)
        }
        
        // Parse Title
        if let i = tempTitle.firstIndex(of: "/") {
            tempTitle.remove(at: i)
        } else if let j = tempTitle.firstIndex(of: ",") {
            tempTitle.remove(at: j)
        }

        print(tempArtist)
        print(tempTitle)
       
        
        guard let url = URL(string: "https://api.lyrics.ovh/v1/\(tempArtist)/\(tempTitle)") else {return songLyrics.text = "No Lyrics Found"}

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

extension String {
    func removeingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
