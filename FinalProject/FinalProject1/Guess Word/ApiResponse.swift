//
//  ApiResponse.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 7/8/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation


struct WordGuess: Codable {
    let words :[WordObjects]
}

struct WordObjects : Codable{
     let word    :String
     let image1  :String
     let image2  :String
     let image3  :String
     let image4  :String
}

struct APIResponse {
    func getBands(completion: @escaping (WordGuess)->()){
            
            guard let url = URL(string: "https://run.mocky.io/v3/1ee31df1-4084-44ce-9839-c606e02f6a5c") else{return}
            
            URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else{return}
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(WordGuess.self, from: data)
                
                completion(response)
               
                
            }catch{print(error.localizedDescription)}
            
            }.resume()
       }

}

