//
//  ViewController.swift
//  Homework 32
//
//  Created by Luka Alimbarashvili on 6/2/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import CoreData

class DailyTasksVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var allTask = [Task]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askForNotifications()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    @IBAction func chechNotificationStatus(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .denied {
                DispatchQueue.main.async {
                    self.showLetterAboutPermissionDenied()
                }
            } else if settings.authorizationStatus == .authorized {
                DispatchQueue.main.async {
                    self.showLetterAboutPermissionauthorized()
                }
            }
        }

    }
}


extension DailyTasksVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TABLECELL_ID", for: indexPath) as! TableViewCell
        cell.taskName.text = allTask[indexPath.row].name
        cell.time.text = allTask[indexPath.row].time
        return cell
    }
}


extension DailyTasksVC {
    func fetchData() {
         let context = AppDelegate.coreDataContainer.viewContext
    
         let request: NSFetchRequest<Task> = Task.fetchRequest()
    
         do {
             let Data = try context.fetch(request)
             allTask = Data
           } catch {}
     }
}

extension DailyTasksVC {
    func askForNotifications() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, err) in
            if granted {
                print("opla")
            } else {
                print("pizdec")
            }
        }
      
    }
    
    private func showLetterAboutPermissionDenied() {
         let alert = UIAlertController(title: "შეტყობინებები გამორთულია", message: "სამწუხაროდ თქვენ შეტყობინებებს ვერ მიიღებთ რადგან უარი გვითხარით მათ გამოგზავნაზე. თუ გსურთ რომ მიიღოთ შეტყობინებები გადადით პარამეტრებში და გააქტიურეთ შეტყობინებების გამოგზავნის შესაძლებლობა", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "პარამეტრები", style: .default, handler: { (action) in
             self.openAppSettings()
         }))
         alert.addAction(UIAlertAction(title: "გაუქმება", style: .cancel, handler: nil))
         self.present(alert, animated: true)
     }
    
    private func showLetterAboutPermissionauthorized()  {
        let alert = UIAlertController(title: "შეტყობინებები აქტიურია", message: "თუ გსურთ რომ გააუქმოთ შეტყობინებები გადადით პარამეტრებში და გამორთეთ შეტყობინებების გამოგზავნის შესაძლებლობა", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "პარამეტრები", style: .default,  handler: { (action) in
            self.openAppSettings()
        }))
        alert.addAction(UIAlertAction(title: "გაუქმება", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }

     private func openAppSettings() {
         if let url = URL(string:UIApplication.openSettingsURLString) {
             if UIApplication.shared.canOpenURL(url) {
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
             }
         }
     }
    
    
}


