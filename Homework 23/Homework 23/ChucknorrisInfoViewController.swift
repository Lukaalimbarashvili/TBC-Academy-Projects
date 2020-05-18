//
//  ChucknorrisInfoViewController.swift
//  Homework 23
//
//  Created by Luka Alimbarashvili on 5/18/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

struct ChuckJokes: Codable {
    let categories  :[String]
    let created_at  :String
    let icon_url    :String
    let id          :String
    let updated_at  :String
    let url         :String
    let value       :String
}

class ChucknorrisInfoViewController: UIViewController {

    @IBOutlet weak var chuckJokes: UILabel!
    
    var tempJoke :String?
    var tempColor:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chuckJokes.text = ""
        getJSON()
        view.backgroundColor = hexStringToUIColor(hex: tempColor!)
    }
    
    func getJSON() {
           let url = URL(string: "https://api.chucknorris.io/jokes/random?category=dev")!
           URLSession.shared.dataTask(with: url) { (data, res, err) in
               
               guard let data = data else {return}
               
               do {
                   let decoder = JSONDecoder()
                   let ChuckJokesJSON = try decoder.decode(ChuckJokes.self, from: data)
                
                self.tempJoke = ChuckJokesJSON.value
                   
                   DispatchQueue.main.async {
                    self.chuckJokes.text = self.tempJoke
                    
                   }
               } catch {print(error.localizedDescription)}
               
           }.resume()
       }



}

