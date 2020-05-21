//
//  DetailInfos.swift
//  Homework 25.
//
//  Created by Luka Alimbarashvili on 5/21/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class DetailInfos_VC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var borders: UILabel!
    @IBOutlet weak var currency: UILabel!
    
    var tempName = ""
    var tempCapital = ""
    var tempRegion = ""
    var tempPopulation = ""
    var tempBorders = ""
    var tempCurrency = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = tempName
        capital.text = tempCapital
        region.text = tempRegion
        population.text = tempPopulation
        borders.text = tempBorders
        currency.text = tempCurrency
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
