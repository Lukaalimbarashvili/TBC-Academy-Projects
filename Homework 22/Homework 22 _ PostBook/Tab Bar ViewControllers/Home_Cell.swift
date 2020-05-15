//
//  Home_Cell.swift
//  Homework 22 _ PostBook
//
//  Created by Luka Alimbarashvili on 5/15/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Home_Cell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName_Surname: UILabel!
    @IBOutlet weak var userPost: UILabel!
    @IBOutlet weak var postDate: UILabel!
    
    var tempUser: User! {
        didSet {
            userName_Surname.text = "\(tempUser.name ?? "") \(tempUser.surname ?? "")"
            userPost.text = tempUser.userPost?.post
        
            userImage.image = UIImage(data: tempUser.image!)
            postDate.text = tempUser.userPost?.date?.formattedDate
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
extension Date {
    var formattedDate:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-mm-yyy"
        return formatter.string(from: self)
    }
    
}
