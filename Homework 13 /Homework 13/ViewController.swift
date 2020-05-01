//
//  ViewController.swift
//  Homework 13
//
//  Created by Luka Alimbarashvili on 5/1/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, getData {
    
  
    

    @IBOutlet weak var tableView: UITableView!
    
    var cars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

    }

    @IBAction func AddNewCar(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  newsVC = storyboard.instantiateViewController(identifier: "add_car")
        
        if let unwrappedVC = newsVC as? AddCarInfoViewController {
            unwrappedVC.delegate = self
        }
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    func storeDataHere(carName: String, carPrice: String, carImage: String) {
          let k = Car(name: carName, price: carPrice, carImage: carImage)
          cars.append(k)
          tableView.reloadData()
      }
    
    @IBAction func scrollTop(_ sender: Any) {
        if cars.count == 0 {
            return
        } else {
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    @IBAction func scrollBottom(_ sender: Any) {
        if cars.count == 0 {
            return
        } else {
            let indexPath = IndexPath(row: cars.count-1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)            
        }
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action,view,handler) in
            self.cars.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            handler(true)
            
        }
    
        let config = UISwipeActionsConfiguration(actions: [delete])
        return config
    }
    

}

extension ViewController: UITableViewDataSource {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return cars.count
       }
       
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "car_cell", for: indexPath) as! CarsCell
           cell.carName.text = "Name : \(cars[indexPath.row].name)"
           cell.carPrice.text = "Price : \(cars[indexPath.row].price)"
        cell.carImageView.image = UIImage(named: cars[indexPath.row].carImage)
           return cell
       }
//    mainTableView.setContentOffset(CGPointZero, animated:true)


}


