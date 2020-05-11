//
//  ViewController.swift
//  Homework 19
//
//  Created by Luka Alimbarashvili on 5/11/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class MainFoldersViewController: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        self.title = "Folders"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        CollectionView.reloadData()
    }

    @IBAction func addNewFolder(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(withIdentifier: "ADDFOLDER")
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
}

extension MainFoldersViewController: UICollectionViewDelegate {
    
}
extension MainFoldersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         let customManager = MyFileManager.customManager
         let foldersArray = customManager.contentsOf(url: customManager.mainPath)
         return foldersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "COLLECTIONVIEW_CELL", for: indexPath) as! CollectionViewCell
        
        let customManager = MyFileManager.customManager
        let foldersArray = customManager.contentsOf(url: customManager.mainPath)[indexPath.row]
        cell.folderName.text = foldersArray.pathComponents.last!

        cell.backgroundColor = .systemFill
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let customManager = MyFileManager.customManager
        let foldersArray = customManager.contentsOf(url: customManager.mainPath)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(withIdentifier: "ALLTEXTINFOLDER") as! textsInFolder
        VC.tempURL = foldersArray[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    

}

extension MainFoldersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth =  collectionView.frame.width / 2
        return CGSize(width: itemWidth - 20 - 20, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:30, left: 20, bottom: 10, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
