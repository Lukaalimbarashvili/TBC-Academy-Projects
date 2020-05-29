//
//  ViewController.swift
//  WeeklyProject 1
//
//  Created by Luka Alimbarashvili on 5/25/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class BandSearchVC: UIViewController {
    
    @IBOutlet weak var searchBand: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addFavoriteButton: UIButton!
    
    var allBand = [BandInfo]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var favoriteBands = [Band]()
    var bandNames = [String]()
    var searching = false
    var tempBands = [BandInfo]()
    
    var saveFavBand :BandInfo?
    
    let responds = APIResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFavoriteButton.layer.cornerRadius = 10
        let textFieldInsideSearchBar = searchBand.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        
        responds.getBands { (bands) in
            self.allBand = bands
        }
    }
    
    @IBAction func seeFavBands(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "FAVBANDS_ID") 
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func addFavoriteOnTapped(_ sender: Any) {
        fetchBands()
        for item in favoriteBands {
            bandNames.append(item.name!)
        }
        if saveFavBand == nil {
            alert(title: "Warning", message: "Please tap on your Favorite Band")
        } else if bandNames.contains(saveFavBand!.name) {
            alert(title: "Warning", message: "This band is already in Your Favorite List")
        } else {
            addBand()
            saveFavBand = nil
            makeFancyAnimation()
        }
        
    }
    
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}

extension BandSearchVC  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return tempBands.count
        } else {
            return allBand.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TABLECELL_ID", for: indexPath) as! TableCell
        if searching {
            cell.bandName.text = tempBands[indexPath.row].name
        } else {
            cell.bandName.text = allBand[indexPath.row].name
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemIndigo
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    
}
extension BandSearchVC  :UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searching {
            saveFavBand = tempBands[indexPath.row]
        } else {
            saveFavBand = allBand[indexPath.row]
        }
        
    }
    
    
}


extension BandSearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tempBands = allBand.filter({$0.name.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
        
    }
}

extension BandSearchVC {
    func addBand() {
        let context = AppDelegate.coreDataContainer.viewContext
        let newBand = Band(context: context)
        
        newBand.image = saveFavBand?.img_url
        newBand.name = saveFavBand?.name
        newBand.genre = saveFavBand?.genre
        newBand.info = saveFavBand?.info
        
        do {
            try context.save()
        } catch {}
    }
    func fetchBands() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Band> = Band.fetchRequest()
        
        do {
            let Bands = try context.fetch(request)
            favoriteBands.append(contentsOf: Bands)
            
        } catch {}
    }
}


extension BandSearchVC {
    func makeFancyAnimation() {
        
        let x = view.frame.width / 2 - 50
        let y = view.frame.height + 50
        let tempImage = UIImageView(frame: CGRect(x: x, y: y, width: 100, height: 100))
        tempImage.image = .checkmark
        tempImage.tintColor = .black
        self.view.addSubview(tempImage)
        
    
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
            tempImage.frame.origin.y = y - 300
        }) { (opa) in
            UIView.animate(withDuration: 0.7) {
                 tempImage.alpha = 0
            }
        }
        
    }
}
