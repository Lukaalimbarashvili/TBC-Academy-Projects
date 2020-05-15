//
//  curentUser.swift
//  Homework 22 _ PostBook
//
//  Created by Luka Alimbarashvili on 5/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

class UDManager {
    internal static let NOTE_COUNTER = "NOTE_COUNTER"
    
    static func getUD() -> UserDefaults {
        return UserDefaults.standard
    }
    

    // Save Note
    static func saveNumber(value: String) {
        getUD().set(value, forKey: NOTE_COUNTER)
       }
    // Get Note
    static func getNumber() -> String {
        return getUD().string(forKey: NOTE_COUNTER) ?? "0"
       }

}
