//
//  ChatView.swift
//  Homework 17
//
//  Created by Luka Alimbarashvili on 5/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit


class ChatView: UIViewController, AddChat {
    

    @IBOutlet weak var chatTableView: UITableView!
    
    
    var chatArray:[chatData] = []
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        UDManager.markSecondTabBar()
    }
    
    
    @IBAction func addChat(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addStoryPage = storyboard.instantiateViewController(withIdentifier: "ADD_MESSAGE")
            
        if let realAddStoryPage = addStoryPage as? chatAddView{
            realAddStoryPage.delegate = self
        }
        self.navigationController?.pushViewController(addStoryPage, animated: true)
    }
    
    
    func getSomeDataFromThere(array: chatData) {
        chatArray.append(array)
        chatTableView.reloadData()
       }
   
}


extension ChatView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       let cell = tableView.dequeueReusableCell(withIdentifier: "Calls_cell", for: indexPath) as! chatTableViewCell

        cell.chatName.text = chatArray[indexPath.row].name
        cell.chatMessage.text = chatArray[indexPath.row].message
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // MARK: - ESE MINDODA INFOS GADATANA MEORE GVERDZE MARA RUNTIMES DROS ERORS MIGDEVS DA  MIWERS MEUBNEBA NIL VOPOVE 66 XAZZEO
          
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let addStoryPage = storyboard.instantiateViewController(withIdentifier: "CHAT_DETAILS") as! chatDetailsView
          addStoryPage.x = chatArray[indexPath.row].name
          addStoryPage.y = chatArray[indexPath.row].message

          self.navigationController?.pushViewController(addStoryPage, animated: true)
        
      }

}

extension ChatView: UITableViewDelegate {

}
