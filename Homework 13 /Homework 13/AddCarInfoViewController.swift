//
//  AddCarInfoViewController.swift
//  Homework 13
//
//  Created by Luka Alimbarashvili on 5/1/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

protocol getData {
    func storeDataHere(carName: String,carPrice: String,carImage:String)
}
class AddCarInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCarName: UITextField!
    @IBOutlet weak var addCarPrice: UITextField!
    
    var delegate : getData?
    
    let images = [ "BMW","Ferrari","Porsche"]
    
    var tappedImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Add Car"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func alert(title:String, message: String)  {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
           self.present(alert, animated: true)
       }
    
    @IBAction func AddCar(_ sender: Any) {
        guard let name = addCarName.text, addCarName.hasText else {
            return alert(title: "Warning!", message: "please write car Name ")
        }
        guard let price = addCarPrice.text, addCarPrice.hasText else {
            return alert(title: "Warning!", message: "please write car Price ")
        }
        // keyboard type : Number Pad
        let z = images[tappedImageIndex]
        delegate?.storeDataHere(carName: name, carPrice: price, carImage: z)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension AddCarInfoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCar_cell", for: indexPath) as! AddCarCell
        cell.carsList.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tappedImageIndex = indexPath.row
    }
}


extension AddCarInfoViewController: UITableViewDelegate{
    
    
}
