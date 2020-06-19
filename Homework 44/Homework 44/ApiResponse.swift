//
//  ApiResponse.swift
//  Homework 44
//
//  Created by Luka Alimbarashvili on 6/18/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

struct weather: Codable {
    let timezone  : String
    let currently : cureent?
    let daily     : forecast?
}
struct cureent: Codable {
    let icon        : String
    let temperature : Double?
    let humidity    : Double
    let pressure    : Double
}
struct forecast: Codable {
    let data : [dailyForecast]?
}
struct dailyForecast: Codable {
    let icon           : String
    let temperatureMin : Double?
}

struct APIResponse {
    func weatherApi(lat: String, long: String, completion: @escaping (weather)->()){
         
         guard let url = URL(string: "https://api.darksky.net/forecast/ddcc4ebb2a7c9930b90d9e59bda0ba7a/\(lat),\(long)?exclude=[flags%2Cminutely&fbclid=IwAR2QX1Err5zKDeJKZJg32J4dwlRlMqLx33QCnAFmKq-u-55oUd4AokXvEzM") else{return}
         print(url)
         URLSession.shared.dataTask(with: url){(data,res,err) in
         guard let data = data else{return}
         
         do{
             let decoder = JSONDecoder()
             let response = try decoder.decode(weather.self, from: data)
             
             completion(response)
            
             
         }catch{print(error.localizedDescription)}
         
         }.resume()
    }

}
