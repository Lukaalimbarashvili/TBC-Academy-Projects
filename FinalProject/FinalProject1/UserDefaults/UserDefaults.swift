//
//  DrawingCounter.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/28/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation


class UDManager {
    internal static let NOTE_COUNTER = "NOTE_COUNTER"
    internal static let BOARDING = "false"
    
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
    
    
    // Save Boarding
    static func saveBoarding(value: String) {
        getUD().set(value, forKey: BOARDING)
       }
    // Get Boarding
    static func getBoarding() -> String {
        return getUD().string(forKey: BOARDING) ?? "false"
       }

}
