//
//  ApiResponse.swift
//  Homework 54
//
//  Created by Luka Alimbarashvili on 7/4/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

struct RickyAndMorty: Codable {
    let characters: [character]
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}

struct character: Codable {
    
    let name    : String
    let status  : String
    let species : String
    let image   : String
    
}

struct APIResponse {
    func getRickyAndMortyCharacters(completion: @escaping (RickyAndMorty)->()){
            
            guard let url = URL(string: "https://rickandmortyapi.com/api/character/?fbclid=IwAR2_N4mpSq2gbxnrV8-xI5E3QoK0WcMPDF7bf1fILsNOzntSAKJyrlkeX80") else{return}
            
            URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else{return}
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(RickyAndMorty.self, from: data)
                
                completion(response)
               
                
            }catch{print(error.localizedDescription)}
            
            }.resume()
       }
}

