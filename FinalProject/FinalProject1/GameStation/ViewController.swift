//
//  ViewController.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/23/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsHorizontalScrollIndicator = false
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        setupAppHeader()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 350)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        askForNotifications()
        tasksNotification(task: "Yo Yo You haven't played my games for a While, Dont you want to come back", time: "20:00")
        
    }
    
    private func setupAppHeader() {
        let maxX = view.frame.maxX
        let midX = view.frame.midX
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: maxX, y: 0))
        path.addLine(to: CGPoint(x: maxX, y: 200))
        path.addCurve(to: CGPoint(x: 0, y: 230), controlPoint1: CGPoint(x: midX - 40, y: 200 - 10), controlPoint2: CGPoint(x: midX - 30, y: 200 + 40))
        path.addLine(to: .zero)
        path.close()
    
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.init(red: 0/255, green: 195/255, blue: 255/255, alpha: 1).cgColor
        
        self.view.layer.addSublayer(shapeLayer)
        
        let label = UILabel.init()
        label.frame = CGRect(x: 25, y: 100, width: UIScreen.main.bounds.size.width - 20.0 , height: 40)
        label.textColor = .white
        label.font = UIFont(name: "verdana-Bold", size: 40)
        label.text = "Game Station"
        self.view.addSubview(label)
        
        
    }
    
    func askForNotifications() {
          let center = UNUserNotificationCenter.current()
          
          center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, err) in
              if granted {
                  print("opaa")
              } else {
                  print("pizdec")
              }
          }
        
      }
    
    func tasksNotification(task: String, time:String) {
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        
        content.title = "MobaGames"
        content.body = "\(task)"
        content.sound = UNNotificationSound.default
        
        
        //Get Hours and Minutes
        
        let parts = time.components(separatedBy: ":")
        
        var dateComponents = DateComponents()
        dateComponents.hour = Int(parts[0])
        dateComponents.minute = Int(parts[1])
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
    
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gameStation.allGame, for: indexPath) as! allGame_Cell

        cell.tempGame = myGames[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "DrawGame")
            self.navigationController?.pushViewController(VC, animated: true)
        } else if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "Baccara")
            self.navigationController?.pushViewController(VC, animated: true)
        } else if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "cardFlipGame")
            self.navigationController?.pushViewController(VC, animated: true)
        } else if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "GuessWord")
            self.navigationController?.pushViewController(VC, animated: true)
        } else if indexPath.row == 4 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "map")
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}

