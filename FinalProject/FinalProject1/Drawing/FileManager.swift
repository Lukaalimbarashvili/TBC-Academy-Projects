//
//  FileManager.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/28/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

struct LocalFiles {
    
    func getImages() -> [URL] {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            return try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
        } catch {
            print("Error")
        }
        return [documentsURL,documentsURL]
    }
    
}
