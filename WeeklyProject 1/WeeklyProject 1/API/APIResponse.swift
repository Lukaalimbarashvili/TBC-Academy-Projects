//
//  APIResponse.swift
//  WeeklyProject 1
//
//  Created by Luka Alimbarashvili on 5/25/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

struct BandInfo: Codable {
    let name    :String
    let img_url :String
    let info    :String
    let genre   :String
}


struct APIResponse {
    func getBands(completion: @escaping ([BandInfo])->()){
            
            guard let url = URL(string: "http://www.mocky.io/v2/5ec3ab0f300000850039c29e") else{return}
            
            URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else{return}
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode([BandInfo].self, from: data)
                
                completion(response)
               
                
            }catch{print(error.localizedDescription)}
            
            }.resume()
       }

}
