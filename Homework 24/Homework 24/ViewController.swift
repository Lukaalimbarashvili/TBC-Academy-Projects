//
//  ViewController.swift
//  Homework 24
//
//  Created by Luka Alimbarashvili on 5/19/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var allBand = [BandInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        getJSON_BandInfos()
    }

    func getJSON_BandInfos() {
        let url = URL(string: "http://www.mocky.io/v2/5ec3ab0f300000850039c29e")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let unwrappedData = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let BandsJSON = try decoder.decode([BandInfo].self, from: unwrappedData)
                self.allBand.append(contentsOf: BandsJSON)

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {print(error.localizedDescription)}
            
        }.resume()
    }

}

extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allBand.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COLLECTION_CELL", for: indexPath) as! Collection_Cell
    
        cell.bandName.text = allBand[indexPath.row].name
        allBand[indexPath.row].img_url.downloadImage { (image) in
            DispatchQueue.main.async {
                cell.bandImage.image = image
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let VC = storyboard.instantiateViewController(identifier: "DETAIL_INFOS") as! Detail_Infos_VC
           VC.tempInfo = allBand[indexPath.row].info
           VC.BandName = allBand[indexPath.row].name
           self.navigationController?.pushViewController(VC, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemWidth =  collectionView.frame.width / 2

        return CGSize(width: itemWidth - 20 - 20, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:20, left: 25, bottom: 20, right: 25)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
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
