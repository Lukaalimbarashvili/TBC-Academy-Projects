//
//  DataBase.swift
//  Homework 16
//
//  Created by Luka Alimbarashvili on 5/6/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

class UDManager {
    internal static let KEY_USERNAME = "KEY_USERNAME"
    internal static let KEY_EMAIL = "KEY_EMAIL"
    internal static let KEY_PASSWORD = "KEY_PASSWORD"
    internal static let KEY_NOTE = "KEY_NOTE"
    internal static let KEY_BGCOLOR = "KEY_BGCOLOR"
    
    
    internal static let FIRST_PAGE_LAUNCHED = "FIRST_PAGE_LAUNCHED"
    
    static func getUD() -> UserDefaults {
        return UserDefaults.standard
    }
    
    // Save username
    static func saveUsername(value: String) {
        getUD().set(value, forKey: KEY_USERNAME)
    }
    // Get username
    static func getUsername() -> String {
        return getUD().string(forKey: KEY_USERNAME) ?? ""
    }
    
    
    
    // Save passwprd
    static func savePassword(value: String) {
        getUD().set(value, forKey: KEY_PASSWORD)
       }
    // Get password
    static func getPassword() -> String {
        return getUD().string(forKey: KEY_PASSWORD) ?? ""
       }
    
    
    
    // Save email
       static func saveEmail(value: String) {
           getUD().set(value, forKey: KEY_EMAIL)
          }
    // Get email
       static func getEmail() -> String {
           return getUD().string(forKey: KEY_EMAIL) ?? ""
          }
    
    
    
    
    // Save Note
    static func saveNote(value: String) {
        getUD().set(value, forKey: KEY_NOTE)
       }
    // Get Note
    static func getNote() -> String {
        return getUD().string(forKey: KEY_NOTE) ?? ""
       }
    
    
    
    
    
    // Save bgColor
       static func saveBgcolor(value: String) {
           getUD().set(value, forKey: KEY_BGCOLOR)
          }
    // Get bgColor
       static func getBgcolor() -> String {
           return getUD().string(forKey: KEY_BGCOLOR) ?? ""
          }
    
    
    
    static func markFirstPageIsLaunched(){
        getUD().set(true, forKey: FIRST_PAGE_LAUNCHED)
    }
    
    static func unmarkFirstPageIsLaunched(){
        getUD().set(false, forKey: FIRST_PAGE_LAUNCHED)
    }
    
    static func isFirstPageLaunched() -> Bool {
        return getUD().bool(forKey: FIRST_PAGE_LAUNCHED)
    }
    
}
