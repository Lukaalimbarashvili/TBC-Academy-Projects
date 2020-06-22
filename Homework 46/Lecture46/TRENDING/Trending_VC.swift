//
//  Trending_VC.swift
//  Lecture46
//
//  Created by Luka Alimbarashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class Trending_VC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var buttonNames = ["ALL","Hip-Hop","Podcasts","Bollywood","R&B","Jazz"]
    var counter = 1
     
    var trending1 = trendingMusic(trending: " # 1 ", image: "trending_pic1", songName: "Kohinoor", artist: "DIVINE")
    var trending2 = trendingMusic(trending: " # 2 ", image: "trending_pic2", songName: "Titanium", artist: "David Guetta ft. SIA")
    var trending3 = trendingMusic(trending: " # 3 ", image: "trending_pic3", songName: "Maradona Rid...", artist: "DJ Snake, Niniola")
    var trending4 = trendingMusic(trending: " # 4 ", image: "trending_pic4", songName: "Gold", artist: "Imagine Dragons")
    var trending5 = trendingMusic(trending: " # 5 ", image: "trending_pic5", songName: "Talk", artist: "Khalid feat. Disclosure")
    
   
    var allTrending = [trendingMusic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
        allTrending = [trending1,trending2,trending3,trending4,trending5]
        collectionView.register(UINib(nibName: "TrendingButtonCell", bundle: nil), forCellWithReuseIdentifier: "trending_cell")
        tableView.register(UINib(nibName: "Trending_TableViewCell", bundle: nil), forCellReuseIdentifier: "TrendingCell_id")
    }
    

    

}

extension Trending_VC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        buttonNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trending_cell", for: indexPath) as! TrendingButtonCell
        cell.buttonName.setTitle("\(buttonNames[indexPath.row])", for: .normal)
        return cell
    }
    
    
}

extension Trending_VC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemWidth =  collectionView.frame.width / 4
        
        return CGSize(width: itemWidth , height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:0, left: 10, bottom: 0, right: 10)
    }

}

extension Trending_VC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTrending.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingCell_id", for: indexPath) as! Trending_TableViewCell
        
        let index = allTrending[indexPath.row]
        
        
        cell.ImageView.image = UIImage(named: index.image)
        cell.ratingLabel.text = index.trending
        cell.songName.text = index.songName
        cell.artist.text = index.artist
           
        return cell
        
       }
}
