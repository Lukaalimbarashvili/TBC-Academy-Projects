//
//  Extensions.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/28/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

extension UIView {
    
    func takeScreenShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil {
            return image!
        }
        
        return UIImage()
    }
}


extension String {
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
      guard let url = URL(string: "\(self)") else {return}
      URLSession.shared.dataTask(with: url) { (data, res, err) in
        guard let data = data else {return}
        completion(UIImage(data: data))
      }.resume()
    }

}
