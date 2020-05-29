//
//  FavoriteBandsVC.swift
//  WeeklyProject 1
//
//  Created by Luka Alimbarashvili on 5/25/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class FavoriteBandsVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
 
    var favoriteBands = [Band]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    var newInfo = ""
    var tempBandForYoutubeLink = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorite Bands"
        fetchBands()
    }
    @IBAction func moreOnTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "INFOS_ID") as! InfoVC
        selectionVC.tempInfo = newInfo
        selectionVC.tempBand = tempBandForYoutubeLink
        present(selectionVC,animated: true, completion: nil)
    }
      
}

extension FavoriteBandsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COLLECTIONCELL_ID", for: indexPath) as! CollectionCell
        
        favoriteBands[indexPath.row].image!.downloadImage { (image) in
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        }
        cell.nameLabel.text = favoriteBands[indexPath.row].name
        cell.genreLabel.text = favoriteBands[indexPath.row].genre
        return cell
    }
    
    
}

extension FavoriteBandsVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemWidth =  collectionView.frame.width / 2

        return CGSize(width: itemWidth - 20 - 20, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:20, left: 20, bottom: 20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

extension FavoriteBandsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionCell
        
        newInfo = favoriteBands[indexPath.row].info!
        tempBandForYoutubeLink = favoriteBands[indexPath.row].name!
        if (cell?.imageView.isHidden)! {
            cell?.flipDown()
        } else {
            cell?.flipUp()
        }
    
    }
  
}

extension FavoriteBandsVC {
    func fetchBands() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Band> = Band.fetchRequest()
        
        do {
            let Bands = try context.fetch(request)
            favoriteBands.append(contentsOf: Bands)
        
        } catch {}
    }
}

extension String {
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}
