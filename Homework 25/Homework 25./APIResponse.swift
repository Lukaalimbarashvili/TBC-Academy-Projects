//
//  APIResponse.swift
//  Homework 25.
//
//  Created by Luka Alimbarashvili on 5/21/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import Foundation

struct CountryInfo: Codable {
    let name       :String
    let capital    :String
    let currencies :[Currency]
    let borders    :[String]
    let region     :String
    let population :Int

}

struct Currency: Codable {
    let code   :String?
    let name   :String?
    let symbol :String?
}


struct APIResponse {
    func getCountryInfoByName(countryName:String, completion: @escaping ([CountryInfo])->()){
        
        guard let url = URL(string: "https://restcountries.eu/rest/v2/name/\(countryName)") else{return}
        
    URLSession.shared.dataTask(with: url){(data,res,err) in
        guard let data = data else{return}
        
        do{
            let decoder = JSONDecoder()
            let response = try decoder.decode([CountryInfo].self, from: data)
            
            completion(response)
            
        }catch{print(error.localizedDescription)}
        
        }.resume()
}
    func getCountryInfoByCapital(countryCapital:String, completion: @escaping ([CountryInfo])->()){
        
        guard let url = URL(string: "https://restcountries.eu/rest/v2/capital/\(countryCapital)") else{return}
        
        URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else{return}
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode([CountryInfo].self, from: data)
                
                completion(response)
                
            }catch{
                completion([])
                print(error.localizedDescription)}

            }.resume()
    }
    func statusCode(countryName:String, completion: @escaping ([CountryInfo])->()){
        guard let url = URL(string: "https://restcountries.eu/rest/v2/name/\(countryName)") else{return}
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard let response = response as? HTTPURLResponse else{return}
            
            if response.statusCode == 200{
                self.getCountryInfoByName(countryName: countryName, completion: { (countries) in
                    completion(countries)
                })
            }else{
                self.getCountryInfoByCapital(countryCapital: countryName, completion: { (countries) in
                    completion(countries)
                })
            }
        }
        task.resume()
}
}


