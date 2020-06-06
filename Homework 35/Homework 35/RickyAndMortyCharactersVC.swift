//
//  ViewController.swift
//  Homework 35
//
//  Created by Luka Alimbarashvili on 6/5/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import ShimmerSwift
import SkeletonView
import UIKit

class RickyAndMortyCharactersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let response = APIResponse()
    
    var allChar  = [character]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        self.view.showAnimatedGradientSkeleton()
        view.isSkeletonable = true
        
        response.getRickyAndMortyCharacters { (RickyAndMorty) in
            self.allChar = RickyAndMorty.characters
            
            DispatchQueue.main.async {
                 self.view.hideSkeleton()
            }
            
        }
    }
}

extension RickyAndMortyCharactersVC: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "CHARCELL_ID"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allChar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CHARCELL_ID", for: indexPath) as! Character_Cell
        
            cell.name.text     = allChar[indexPath.row].name
            cell.tempStatus    = allChar[indexPath.row].status
            cell.species.text  = allChar[indexPath.row].species
            cell.tempImage     = allChar[indexPath.row].image
        
            return cell
    }
    
    
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
