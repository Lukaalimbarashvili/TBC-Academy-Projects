//
//  TableViewCell.swift
//  Homework 34
//
//  Created by Luka Alimbarashvili on 6/17/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Lane: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var magicVariable: ((IndexPath,String) -> Void)?
    
    let MainViewController = ViewController()
    var tempChamps = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}

extension TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempChamps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COLLECTION_CELL_ID", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: tempChamps[indexPath.row])
        return cell
    }
}

extension TableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 150, height: 150)
    }
}

extension TableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
        magicVariable?(indexPath,tempChamps[indexPath.row])
        
    }
}
