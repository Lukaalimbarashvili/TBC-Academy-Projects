//
//  Notifications.swift
//  Homework 32
//
//  Created by Luka Alimbarashvili on 6/2/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation
import UIKit

func tasksNotification(task: String, time:String) {
    
    let center = UNUserNotificationCenter.current()
    
    let content = UNMutableNotificationContent()
    
    content.title = "Yo yo yo check this task man !"
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


