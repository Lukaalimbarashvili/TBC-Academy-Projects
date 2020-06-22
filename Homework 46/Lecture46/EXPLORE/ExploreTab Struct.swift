//
//  ExploreTab Struct.swift
//  Lecture46
//
//  Created by Luka Alimbarashvili on 6/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation


struct Section {
    let sectionName : String
    let musics      : [musicInfo]
}


struct  musicInfo {
    let image  : String
    let artist : String
}
