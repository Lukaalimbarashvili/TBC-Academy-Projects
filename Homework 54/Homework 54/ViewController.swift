//
//  ViewController.swift
//  Homework 54
//
//  Created by Luka Alimbarashvili on 7/2/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let response = APIResponse()
    var characters = [character]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    let layout = UPCarouselFlowLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        layout.itemSize = CGSize(width: 200, height: 200)
        collectionView.collectionViewLayout = layout
        
        
        response.getRickyAndMortyCharacters { (RickyAndMorty) in
            self.characters = RickyAndMorty.characters
        }
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as! CollectionViewCell
        
        cell.name.text = characters[indexPath.row].name
        
        cell.isLoading(true)
        characters[indexPath.row].image.downloadImage(completion: { (image) in
            
            DispatchQueue.main.async {
                cell.mainImageView.image = image
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    cell.isLoading(false)
                }
            }
        })
        return cell
    }
    
    
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "details") as! Details_VC
        VC.tempChar = characters[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 250, height: 250)
    }
    
}


extension String {
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: "\(self)") else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
    
}
