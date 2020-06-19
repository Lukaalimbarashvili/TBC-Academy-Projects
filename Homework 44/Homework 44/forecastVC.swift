//
//  forecastVC.swift
//  Homework 44
//
//  Created by Luka Alimbarashvili on 6/19/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class forecastVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var tempForecast: forecast?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        // Do any additional setup after loading the view.
    }
    

    

}

extension forecastVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tempForecast?.data!.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath) as! TableViewCell
        cell.temp.text = "\(String(describing: tempForecast!.data![indexPath.row].temperatureMin!)) F"
        cell.weatherIcon.text = tempForecast?.data![indexPath.row].icon
        
        if  tempForecast?.data![indexPath.row].icon == "rain" {
            cell.weatherImage.image = UIImage(named: "rain")
        } else if tempForecast?.data![indexPath.row].icon == "sunny" {
           cell.weatherImage.image = UIImage(named: "sun")
        } else {
            cell.weatherImage.image = UIImage(named: "cloud")
        }

        return cell
    }
    
    
}
