//
//  DataBase.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

class UDManager {
    internal static let FIRST_PAGE_LAUNCHED = "FIRST_PAGE_LAUNCHED"
    
    static func getUD() -> UserDefaults {
        return UserDefaults.standard
    }
       
    
    static func markFirstTabBar(){
        getUD().set("1", forKey: FIRST_PAGE_LAUNCHED)
    }
    
    static func markSecondTabBar(){
        getUD().set("2", forKey: FIRST_PAGE_LAUNCHED)
    }
    static func markThirdTabBar(){
    //        getUD().set(false, forKey: FIRST_PAGE_LAUNCHED)
        getUD().set("3", forKey: FIRST_PAGE_LAUNCHED)
    }
    
    static func isFirstPageLaunched() -> String {

        return getUD().string(forKey: FIRST_PAGE_LAUNCHED) ?? ""
    }
    
}
