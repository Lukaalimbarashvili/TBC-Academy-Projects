//
//  MyArts_VC.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/28/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class MyArts_VC: UIViewController {

    @IBOutlet weak var goBack: UIButton!
    
    var imageUrls = [URL]()
    var imgGetter = LocalFiles()
     
    
     
     override func viewDidLoad() {
         super.viewDidLoad()
        goBack.layer.cornerRadius = 10

        imageUrls = imgGetter.getImages()

     }
    
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


extension MyArts_VC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DrawingCellIds.myDrawings, for: indexPath) as! myDrawingsTableCell
        
        let imageData:NSData = NSData(contentsOf: imageUrls[indexPath.row])!
        
        let image = UIImage(data: imageData as Data)
        
        cell.mainImageView.image = image
        return cell
    }
    
    
}
