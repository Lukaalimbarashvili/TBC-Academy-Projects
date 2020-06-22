//
//  Explore_VC.swift
//  Lecture46
//
//  Created by Luka Alimbarashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit



class Explore_VC: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    
    var sectionNames = ["Recently played","Recommended for you"]
    
    var sec1Music1 = musicInfo(image: "pic1" , artist: "061 Marketing...")
    var sec1Music2 = musicInfo(image: "pic2" , artist: "Lights")
    var sec1Music3 = musicInfo(image: "pic3" , artist: "Sounds Like G...")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        tableView.rowHeight = 200
//        self.collectionView.register(UINib(nibName: "CollectionViewCell_1", bundle: nil), forCellWithReuseIdentifier: "cell1")
        
//        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell_id")
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell_id")
        
    }
    

   
}




extension Explore_VC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath) as! TableViewCell
        let sections = [  Section(sectionName: "Recently played", musics: [sec1Music1,sec1Music2,sec1Music3]),
                          Section(sectionName: "Recommended for you", musics: [sec1Music1,sec1Music1,sec1Music1])
            
        ]

        cell.sectionName.text = sectionNames[indexPath.row]
        cell.tempSection = sections[indexPath.row]
        
        return cell
    }
    
    
}

//extension FavoriteBandsVC: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let itemWidth =  collectionView.frame.width / 2
//
//        return CGSize(width: itemWidth - 20 - 20, height: 150)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top:20, left: 20, bottom: 20, right: 20)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 30
//    }
//}
