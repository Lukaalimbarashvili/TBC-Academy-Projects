//
//  ApiResponse.swift
//  Homework 44
//
//  Created by Luka Alimbarashvili on 6/18/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

struct BandInfo: Codable {
    let base : String
}


struct APIResponse {
    func getBands(completion: @escaping (BandInfo)->()){
         
         guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=37.33233141&lon=-122.0312186&appid=2704cacc2c66d5007479b5ce5a031a1d") else{return}
         
         URLSession.shared.dataTask(with: url){(data,res,err) in
         guard let data = data else{return}
         
         do{
             let decoder = JSONDecoder()
             let response = try decoder.decode(BandInfo.self, from: data)
             
             completion(response)
            
             
         }catch{print(error.localizedDescription)}
         
         }.resume()
    }

}
