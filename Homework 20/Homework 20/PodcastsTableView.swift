//
//  ViewController.swift
//  Homework 20
//
//  Created by Luka Alimbarashvili on 5/13/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class PodcastsTableView: UIViewController, FilterMode {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var isFiltering = false
    var TimeChooser = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Podcasts"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    @IBAction func addNewPodcast(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  newsVC = storyboard.instantiateViewController(identifier: "ADDPODCAST")
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    @IBAction func filtPodcasts(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  newsVC = storyboard.instantiateViewController(identifier: "TIME_PICKER")
        if let unwrappedVC = newsVC as? ChooseTime {
            unwrappedVC.delegate = self
        }
        self.show(newsVC, sender: sender)
    }
    
    func getData(time: Int, filterMode: Bool) {
        isFiltering = filterMode
        TimeChooser = time
    }
    
}

extension PodcastsTableView: UITableViewDelegate {
    
}

extension PodcastsTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Podcast> = Podcast.fetchRequest()
        
        do{
            let result = try context.fetch(request)
            
            let pod = result as? [NSManagedObject]
            return pod!.count
        }catch{}
        
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PODCAST_CELL", for: indexPath) as! TableViewCell
        
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Podcast> = Podcast.fetchRequest()
        
        if isFiltering {
            
//            do{
//                let result = try context.fetch(request)
//
//                let pod = result as? [NSManagedObject]
//
//                let tempArray = pod?[indexPath.row] as? Podcast
//
//                if tempArray!.date! == "45" {
//
//                }
//                    cell.finalTopic.text = tempArray?.name
//                    cell.finalAbout.text = tempArray?.text
//                    cell.finalDate.text = tempArray?.date
//
//            } catch{}
            
            
        } else {
            do{
                let result = try context.fetch(request)
                
                let pod = result as? [NSManagedObject]
                
                let tempArray = pod?[indexPath.row] as? Podcast
                cell.finalTopic.text = tempArray?.name
                cell.finalAbout.text = tempArray?.text
                cell.finalDate.text = tempArray?.date
                
            } catch{}
            
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addStoryPage = storyboard.instantiateViewController(withIdentifier: "DETAIL_INFO") as! Detail_Info
        
        
        
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Podcast> = Podcast.fetchRequest()
        
        do{
            let result = try context.fetch(request)
            let pod = result as? [NSManagedObject]
            let tempArray = pod?[indexPath.row] as? Podcast
            addStoryPage.tempTopic = tempArray!.name!
            addStoryPage.tempText = tempArray!.text!
            addStoryPage.tempTime = "Time : \(tempArray!.date!)"
        } catch{}
        
        self.navigationController?.pushViewController(addStoryPage, animated: true)
        
    }
    
}

