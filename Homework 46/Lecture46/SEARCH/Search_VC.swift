//
//  Search_VC.swift
//  Lecture46
//
//  Created by Luka Alimbarashvili on 6/23/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class Search_VC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Searching_TableViewCell", bundle: nil), forCellReuseIdentifier: "search_id")
        collectionView.register(UINib(nibName: "Searching_CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "searching_cell")
        tableView.rowHeight = 96

    }
    


}


extension Search_VC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "search_id", for: indexPath)
        return cell
    }
    
    
}


extension Search_VC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searching_cell", for: indexPath) as! Searching_CollectionViewCell
        return cell
    }
    
    
}

extension Search_VC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
