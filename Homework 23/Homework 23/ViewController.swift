//
//  ViewController.swift
//  Homework 23
//
//  Created by Luka Alimbarashvili on 5/18/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

struct ColorJSN: Codable {
    let colorInfo : [Colors]
    
    enum CodingKeys: String, CodingKey {
           case colorInfo = "data"
       }
}

struct Colors: Codable {
    let id            :Int
    let name          :String
    let year          :Int
    let color         :String
    let pantone_value :String
}

class ViewController: UIViewController {
    
    var colors = [Colors]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        getJSON()
 
    }
    
    func getJSON() {
        let url = URL(string: "https://reqres.in/api/unknown")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let colorsJSON = try decoder.decode(ColorJSN.self, from: data)
                
                self.colors.append(contentsOf: colorsJSON.colorInfo)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {print(error.localizedDescription)}
            
        }.resume()
    }



}

extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COLORCELL_ID", for: indexPath) as! ColorsCell
        
        cell.colorCode.text = colors[indexPath.row].color
        cell.ColorName.text = colors[indexPath.row].name
        let tempColor = colors[indexPath.row].color
        cell.backgroundColor = hexStringToUIColor(hex: tempColor)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let VC = storyboard.instantiateViewController(identifier: "Chuck_Jokes") as! ChucknorrisInfoViewController
           VC.tempColor = colors[indexPath.row].color
           self.navigationController?.pushViewController(VC, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth =  collectionView.frame.width / 2
        
        return CGSize(width: itemWidth - 20 - 20, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:30, left: 20, bottom: 10, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}



func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
