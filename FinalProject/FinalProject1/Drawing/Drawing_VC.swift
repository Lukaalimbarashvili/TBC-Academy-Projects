//
//  Drawing_VC.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 6/24/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class Drawing_VC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var colorsView: UIView!
    @IBOutlet weak var toolsView: UIView!
    @IBOutlet weak var canvasView: CanvasView!

   
    @IBOutlet var buttons: [UIButton]!
    
    
    let colors : [UIColor] = [.red, .blue, .black, .white, .purple, .yellow, .green, .gray, .orange, .systemIndigo, .brown, .magenta, .systemPink, .systemTeal]
    
    var showTools = false
    let canvas = CanvasView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for item in buttons {
            item.layer.cornerRadius = 10
        }

        toolsView.isHidden = true
        colorsView.isHidden = true
        
    }
    

    @IBAction func OnBackButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func showTools(_ sender: Any) {
        if showTools {
            toolsView.isHidden = true
            colorsView.isHidden = true
            showTools = false
        } else {
            toolsView.isHidden = false
            colorsView.isHidden = false
            showTools = true
        }
    }
    
    @IBAction func onSave(_ sender: Any) {
        
        let screenshoot = self.canvasView.takeScreenShot() 
        let url = try! FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        guard let data = screenshoot.jpegData(compressionQuality: 1) ?? screenshoot.pngData() else {
            return
        }
        print(url)
        
        let newNoteIndex = UDManager.getNumber()
        let z = Int(newNoteIndex)! + 1
        UDManager.saveNumber(value: "\(z)")
        
        try! data.write(to: url.appendingPathComponent("myArt\(z).png"))
 
        makeFancyAnimation()
    }
    
    @IBAction func onUndo(_ sender: Any) {
         canvasView.undoDraw()
    }
    
    @IBAction func onErase(_ sender: Any) {
        canvasView.clearCanvasView()
    }
    
    @IBAction func onMyarts(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Drawing", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "myDrawings")
        self.navigationController?.pushViewController(VC, animated: true)
    }

    @IBAction func onBrushWidth(_ sender: UISlider) {
        canvasView.strokeWidth = CGFloat(sender.value)
    }
    
    func makeFancyAnimation() {
          
          let x = view.frame.width / 2 - 50
          let y = view.frame.height + 50
          let tempImage = UIImageView(frame: CGRect(x: x, y: y, width: 100, height: 100))
          tempImage.image = .checkmark
          tempImage.tintColor = .black
          self.view.addSubview(tempImage)
          
      
          UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
              tempImage.frame.origin.y = y - 300
          }) { (opa) in
              UIView.animate(withDuration: 0.7) {
                   tempImage.alpha = 0
              }
          }
          
      }
}


extension Drawing_VC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrawingCellIds.colors, for: indexPath) as! colors_Cell
        
       
        cell.layer.cornerRadius = 10
        
        if colors[indexPath.row] == .white {
            cell.backgroundColor = colors[indexPath.row]
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
        } else {
             cell.backgroundColor = colors[indexPath.row]
        }
        return cell
    }
    
    
}

extension Drawing_VC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         let color = colors[indexPath.row]
         canvasView.strokeColor = color
     }
}


extension Drawing_VC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}


