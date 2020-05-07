//
//  callsStruct.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation


struct callsInfo {
    var number: String
    var country: String
    var date: String
}


let call_1 = callsInfo(number: "+995 579 23 23 54", country: "USA", date: "20/07/2019")
let call_2 = callsInfo(number: "+995 568 34 34 92", country: "GEORGIA", date: "10/03/2019")
let call_3 = callsInfo(number: "+995 568 34 76 56", country: "ARMENIA", date: "10/03/2019")
let call_4 = callsInfo(number: "+995 568 34 76 92", country: "GEORGIA", date: "10/03/2019")
let call_5 = callsInfo(number: "+995 568 80 23 92", country: "USA", date: "10/03/2019")
let call_6 = callsInfo(number: "+995 568 34 76 67", country: "ARMENIA", date: "10/03/2019")
let call_7 = callsInfo(number: "+995 568 46 24 87", country: "SPAIN", date: "10/03/2019")
let call_8 = callsInfo(number: "+995 568 67 23 92", country: "USA", date: "10/03/2019")
let call_9 = callsInfo(number: "+995 568 34 76 45", country: "GEORGIA", date: "10/03/2019")
let call_10 = callsInfo(number: "+995 568 35 67 56", country: "GEORGIA", date: "10/03/2019")

var callsArray = [call_1,call_2,call_3,call_4,call_5,call_6,call_7,call_8,call_9,call_10]
