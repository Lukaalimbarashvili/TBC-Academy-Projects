//
//  onBoarding_VC.swift
//  FinalProject1
//
//  Created by Luka Alimbarashvili on 7/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class onBoarding_VC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var imgArr = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgArr = [#imageLiteral(resourceName: "pic3"),#imageLiteral(resourceName: "pic2"),#imageLiteral(resourceName: "pic1")]

        scrollView.contentSize.width = CGFloat(imgArr.count) * self.view.frame.width
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.frame.size = self.view.frame.size
        scrollView.backgroundColor = .white
        
        for n in 0..<imgArr.count {
                  
            let imageView = UIImageView()
            imageView.image = imgArr[n]
            let xPosition = self.view.frame.width * CGFloat(n)
            let yPosition = self.scrollView.frame.height / 2 - 300
            imageView.frame = CGRect(x: xPosition, y: yPosition, width: self.scrollView.frame.width, height: 400)
            scrollView.addSubview(imageView)
        
        }
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
        label1.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2 + 200)
        label1.textColor = .black
        label1.textAlignment = .center
        label1.numberOfLines = 0
        label1.font = UIFont(name: label1.font.fontName, size: 27)
        
        label1.text = "Welcome To the Best gaming app"
        scrollView.addSubview(label1)
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
        label.center = CGPoint(x: self.view.frame.width + self.view.frame.width / 2, y: self.view.frame.height / 2 + 200)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: label1.font.fontName, size: 27)
        
        label.text = "Where you can find all kinds of game united in one App"
        scrollView.addSubview(label)
        
        
        
        let t = self.view.frame.width - 80 / 2
        let button = UIButton(frame: CGRect(x: self.view.frame.width * 3 - t, y: self.view.frame.height / 2 + 250, width: self.view.frame.width - 80, height: 60))
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: label.font.fontName, size: 30)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(onStart), for: .touchUpInside)
        scrollView.addSubview(button)
    }
    
    @objc func onStart() {
        
        let userDefault = UserDefaults.standard
        userDefault.set(true, forKey: "onBoardingComplete")
        userDefault.synchronize()
        
        UDManager.saveBoarding(value: "true")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "gameMenu")
        vc?.modalPresentationStyle = .fullScreen
        vc?.modalTransitionStyle = .crossDissolve
        self.present(vc!, animated: true, completion: nil)
    }


}


extension onBoarding_VC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       let page = scrollView.contentOffset.x / scrollView.frame.width
       pageControl.currentPage = Int(page)
    }
    
}
