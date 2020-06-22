//
//  TableViewCell.swift
//  Lecture46
//
//  Created by Luka Alimbarashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var sectionName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var tempSection: Section?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collection_cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension TableViewCell: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempSection!.musics.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection_cell", for: indexPath) as! CollectionViewCell
        
        cell.name.text = tempSection!.musics[indexPath.row].artist
        cell.imageView.image = UIImage(named: tempSection!.musics[indexPath.row].image)
        
        return cell
    }
    
    
}
