//
//  ViewController.swift
//  Homework 25.
//
//  Created by Luka Alimbarashvili on 5/21/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class allCountries_VC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchCountry: UISearchBar!
    
    var allCountry = [CountryInfo](){
        didSet{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.tableView.reloadData()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        searchCountry.delegate = self
    }


}

extension allCountries_VC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TABLE_CELL", for: indexPath) as! Table_CellTableViewCell
        let borders = allCountry[indexPath.row].borders.joined(separator: ",")
        let Currency = allCountry[indexPath.row].currencies
        var currencySymbols = ""
        Currency.forEach { (c) in
            currencySymbols += c.symbol ?? ""
        }
        
        
        cell.name.text = allCountry[indexPath.row].name
        cell.capital.text = allCountry[indexPath.row].capital
        cell.borders.text = borders
        cell.currency.text = currencySymbols
        return cell
    }
    
    
}
extension allCountries_VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "DETAILS_ID") as! DetailInfos_VC
        
           
            VC.tempName = allCountry[indexPath.row].name
            VC.tempRegion = allCountry[indexPath.row].region
            VC.tempCapital = allCountry[indexPath.row].capital
            VC.tempPopulation = String(allCountry[indexPath.row].population)
            var x = ""
            for item in allCountry[indexPath.row].borders {
                x += item
            }
            VC.tempBorders = x
            
            var y = ""
            for item in allCountry[indexPath.row].currencies {
                y += item.symbol!
            }
            VC.tempBorders = y
               
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension allCountries_VC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let responds = APIResponse()
        

        guard let searchBarText = searchBar.text else {return}
        responds.statusCode(countryName: searchBarText, completion: { (contries) in
            
                self.allCountry = contries
                            })
    }
    
}

