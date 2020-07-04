//
//  Details_VC.swift
//  Homework 54
//
//  Created by Luka Alimbarashvili on 7/4/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Details_VC: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var species: UILabel!
    
    
    var tempChar: character?
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempChar?.image.downloadImage(completion: { (image) in
            DispatchQueue.main.async {
                 self.mainImageView.image = image
            }
         })
        name.text = tempChar?.name
        status.text = tempChar?.status
        species.text = tempChar?.species

        
    }
    

    

}
