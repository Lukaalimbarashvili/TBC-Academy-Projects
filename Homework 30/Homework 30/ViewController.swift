//
//  ViewController.swift
//  Homework 30
//
//  Created by Luka Alimbarashvili on 6/1/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        var sandro: Person?
        var developer: Job?
        
        sandro = Person()
        developer = Job()
        
        sandro?.job = developer
        developer?.person = sandro
        
        sandro = nil
        developer = nil
        
    }
}
 
class Job {
    var person: Person?
    
    deinit {
        print("Deallocating Job")
    }
}
 
class Person {
    weak var job: Job?
    
    deinit {
        print("Deallocating Person")
    }
}

//  მოცემულ მაგალითში deiinit არ ხდება იმიტომ რომ კლასის შექმნის დროს ჩნდება 2 მიმთითებელი, პრობლემის გადაჭრა ხდება ცვლადის weak-ით მონიშვნით ამ დროს arc არ ითვლის ამ მიმთითებელს და აღიქვამს მხოლოდ 1 მიმთითებელს. ამ შემთხვევაში მარტო person-ს დავუწერე თუმცა შეიძლება job-ს დავუწეროთ ამ შემთხვევაში Deallocating ჯერ person-ის და შემდეგ job-ის მოხდება.
