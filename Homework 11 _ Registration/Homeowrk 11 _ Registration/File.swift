//
//  File.swift
//  Homeowrk 11 _ Registration
//
//  Created by Luka Alimbarashvili on 4/29/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

class UserInfo {
    var name: String
    var surname: String
    var email: String
    var gender: String
    var ageDetector: String
    
    init(name:String, surname:String, email:String, gender:String, ageDetector: String) {
        self.name = name
        self.surname = surname
        self.email = email
        self.gender = gender
        self.ageDetector = ageDetector
    }
}
