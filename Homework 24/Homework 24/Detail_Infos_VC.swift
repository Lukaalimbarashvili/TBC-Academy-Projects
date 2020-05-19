//
//  Detail_Infos_VC.swift
//  Homework 24
//
//  Created by Luka Alimbarashvili on 5/19/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Detail_Infos_VC: UIViewController {
    
    @IBOutlet weak var detail_Info: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var tempInfo = ""
    var allSongs = [Songs]()
    var BandName: String?
    var musicNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSON_BandSongs()
        detail_Info.text = tempInfo
        tableView.dataSource = self
        tableView.delegate = self
        
    }    
    func getJSON_BandSongs(){
        let url = URL(string: "http://www.mocky.io/v2/5ec3ca1c300000e5b039c407")!
        let dispatch = DispatchGroup()
        dispatch.enter()
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let unwrappedData = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let BandsJSON = try decoder.decode(BandSongs.self, from: unwrappedData)
                
                for item in BandsJSON.data {
                    
                    if item.band == self.BandName {
                        for song in item.songs where item.band == self.BandName {
                            self.musicNames.append(contentsOf: song.values)
                        }
                    }
                }
            } catch {print(error.localizedDescription)
            }
            dispatch.leave()
        }.resume()
        
        dispatch.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
}

extension Detail_Infos_VC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return musicNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL", for: indexPath) as! Table_Cell
        cell.SongName.text = musicNames[indexPath.row]
        
        return cell
    }
}

extension Detail_Infos_VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "LYRICS_ID") as! Lyrics_VC
        VC.bandName = BandName!
        VC.songName = musicNames[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
