//
//  JSONFormatter Structs.swift
//  Homework 24
//
//  Created by Luka Alimbarashvili on 5/19/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation


struct BandInfo: Codable {
    let name    :String
    let img_url :String
    let thumb1  :String
    let thumb2  :String
    let thumb3  :String
    let info    :String
    let genre   :String
}

struct BandSongs: Codable {
    let data: [Songs]
}

struct Songs: Codable {
    let band  :String
    let songs :[[String:String]]
}

struct SongLyrics: Codable {
    var lyrics: String
}

