//
//  Demo.swift
//  Homework 18 _ Notes App
//
//  Created by Luka Alimbarashvili on 5/8/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

class MyFileManager {
    
    let fm = FileManager.default
    
    static let customManager = MyFileManager()
    

    
    private init() {}
    

    
    var  mainPath: URL {
        return try! fm.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    // MARK: - CREATE FILE
    func createFile(name: String, text: String, ext: FileExtension) {
        let path = mainPath.appendingPathComponent("\(name).\(ext.rawValue)")

        do {
            try text.write(to: path, atomically: true, encoding: .utf8)
   
        } catch let error {
            print(error)
        }
    }
    
    enum FileExtension: String {
        case txt    = "txt"
        case swift  = "swift"
    }
    
    //MARK: - SEE AND READ CONTENT INSIDE FOLDER
    func contentsOf(url: URL) -> [URL] {
           print(url)
        return try! fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
     
    }
    
    func readText(url: URL) -> String {
        return try! String(contentsOf: url)
    }
    
    //MARK: - DELETE NOTE
     func delete(at url: URL) {
           do {
              try fm.removeItem(at: url)
           } catch {
   
           }
       }
}




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
