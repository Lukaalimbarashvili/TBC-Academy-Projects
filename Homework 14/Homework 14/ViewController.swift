//
//  ViewController.swift
//  Homework 14
//
//  Created by Luka Alimbarashvili on 5/4/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstView = UIView()
    let secondView = UIView()
    let firstTextField = UITextField(frame: CGRect(x: 35, y: 350, width: 100, height: 40))
    let secondTextField = UITextField(frame: CGRect(x: 165, y: 350, width: 100, height: 40))
    let EditButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Edit", for: .normal)
        b.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        b.backgroundColor = .black
        b.layer.cornerRadius = 10
        b.layer.borderColor = UIColor.yellow
        .cgColor
        b.layer.borderWidth = 1
        return b
    }()
    let up: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("UP", for: .normal)
        b.addTarget(self, action: #selector(upButton), for: .touchUpInside)
        b.backgroundColor = .gray
        b.layer.borderWidth = 1
        return b
    }()
    let down: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Down", for: .normal)
        b.addTarget(self, action: #selector(downButton), for: .touchUpInside)
        b.backgroundColor = .gray
        b.layer.borderWidth = 1
        return b
    }()
    let left: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("LEFT", for: .normal)
        b.addTarget(self, action: #selector(leftButton), for: .touchUpInside)
        b.backgroundColor = .gray

        b.layer.borderWidth = 1
        return b
    }()
    let right: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("RIGHT", for: .normal)
        b.addTarget(self, action: #selector(rightButton), for: .touchUpInside)
        b.backgroundColor = .gray
        b.layer.borderWidth = 1
        return b
    }()
    var slider: UISlider!
    
    var tealViewTopConstraint: NSLayoutConstraint!
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - FIRST VIEW
        firstView.backgroundColor = .systemTeal
        firstView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstView)
        
    
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 80),
            firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            firstView.heightAnchor.constraint(equalToConstant: 110),
            firstView.widthAnchor.constraint(equalToConstant: 110)
        ])
        
        firstView.isUserInteractionEnabled = true
        let firstTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.firstTapGesture))
        firstView.addGestureRecognizer(firstTapGesture)
        
        
        // MARK: - SECOND VIEW
          secondView.backgroundColor = .systemPink
          secondView.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(secondView)
          
    
          NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 80),
            secondView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            secondView.heightAnchor.constraint(equalToConstant: 110),
            secondView.widthAnchor.constraint(equalToConstant: 110)
          ])
        
        secondView.isUserInteractionEnabled = true
        let secondTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.secondTapGesture))
        secondView.addGestureRecognizer(secondTapGesture)
        
        // MARK: - FIRST TEXT FIELD
            firstTextField.backgroundColor = .lightGray
            firstTextField.placeholder = "Write Height"
            firstTextField.keyboardType = UIKeyboardType.numberPad
            view.addSubview(firstTextField)
        
        // MARK: - SECOND TEXT FIELD
            secondTextField.backgroundColor = .lightGray
            secondTextField.placeholder = "Write Width"
            secondTextField.keyboardType = UIKeyboardType.numberPad
            view.addSubview(secondTextField)
        
        // MARK: - BUTTON
        view.addSubview(EditButton)
        NSLayoutConstraint.activate([
          EditButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 300),
          EditButton.leadingAnchor.constraint(equalTo: secondTextField.trailingAnchor,constant: 70),
          EditButton.heightAnchor.constraint(equalToConstant: 50),
          EditButton.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        //MARK: - UP BUTTON
        view.addSubview(up)
        NSLayoutConstraint.activate([
          up.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 500),
          up.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 180),
          up.heightAnchor.constraint(equalToConstant: 30),
          up.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        //MARK: - DOWN BUTTON
        view.addSubview(down)
        NSLayoutConstraint.activate([
          down.topAnchor.constraint(equalTo: up.bottomAnchor,constant: 70),
          down.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 180),
          down.heightAnchor.constraint(equalToConstant: 30),
          down.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        //MARK: - LEFT BUTTON
        view.addSubview(left)
        NSLayoutConstraint.activate([
          left.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 550),
          left.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 90),
          left.heightAnchor.constraint(equalToConstant: 30),
          left.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        //MARK: - RIGHT BUTTON
        view.addSubview(right)
        NSLayoutConstraint.activate([
          right.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 550),
          right.leadingAnchor.constraint(equalTo: left.trailingAnchor,constant: 110),
          right.heightAnchor.constraint(equalToConstant: 30),
          right.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        // MARK: - SLIDER
        slider = UISlider(frame: CGRect(x: 0, y: 750, width: self.view.frame.width, height: 20))
        slider.minimumValue = 0
        slider.maximumValue = 70
        slider.value = 35
        slider.tintColor = UIColor.cyan
        slider.thumbTintColor = UIColor.red
        slider.isContinuous = true
//        slider.addTarget(self, action: #selector(sliderInAction(_:)), for: .valueChanged)
        view.addSubview(slider)

        
    }
    
    
    // MARK: - USEABLE FUNCTIONS
    func clearFields(){
        firstTextField.text = nil
        secondTextField.text = nil
    }
    func alert(title:String, message: String)  {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
                self.present(alert, animated: true)
          }
    
 
    // MARK: - FIND TAPPED VIEW HERE
    
    var tappedView = UIView()
     
     @objc func firstTapGesture(){
         tappedView = firstView
     }
     
     @objc func secondTapGesture(){
         tappedView = secondView
     }
    
    // MARK: - RESIZE WIDTH AND HEIGHT
    
    @objc func onButton() {
        guard let height = firstTextField.text, firstTextField.hasText else {return alert(title: "Warning", message: "Choose height")}
        guard let width = secondTextField.text, secondTextField.hasText else {return alert(title: "Warning", message: "Choose Width")}
       
        if tappedView == firstView {
            firstView.heightAnchor.constraint(equalToConstant: CGFloat(Float(height)!)).isActive = true
            firstView.widthAnchor.constraint(equalToConstant: CGFloat(Float(width)!)).isActive = true
            clearFields()
        } else if tappedView == secondView {
            secondView.heightAnchor.constraint(equalToConstant: CGFloat(Float(height)!)).isActive = true
            secondView.widthAnchor.constraint(equalToConstant: CGFloat(Float(width)!)).isActive = true
            clearFields()
        } else {
            alert(title: "Warning", message: "Pick one of the Square")
        }
       
    }
    
   
    // MARK: - MOVE TAPPED SQUARE
    
    var firstTop = 80
    var secondTop = 80
    @objc func upButton() {
            
        if tappedView == firstView {
            firstTop -= 10
            firstView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: CGFloat(firstTop)).isActive = true
        }
        else if tappedView == secondView {
            secondTop -= 10
            secondView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: CGFloat(secondTop)).isActive = true
        } else {
            alert(title: "Warning", message: "Pick one of the Square")
        }
    }
    
    @objc func downButton() {
        if tappedView == firstView {
            firstTop += 10
            firstView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: CGFloat(firstTop)).isActive = true
        } else if tappedView == secondView {
            secondTop += 10
            secondView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: CGFloat(secondTop)).isActive = true
        } else {
            alert(title: "Warning", message: "Pick one of the Square")
        }
    }
    
    var first_Left_Right = 50
    var second_Left_Right = -50
    @objc func leftButton() {
        if tappedView == firstView {
            first_Left_Right -= 10
            firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat(first_Left_Right)).isActive = true
        }
        else if tappedView == secondView {
            second_Left_Right -= 10
            secondView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: CGFloat(second_Left_Right)).isActive = true
        } else {
            alert(title: "Warning", message: "Pick one of the Square")
        }
        
    }

    @objc func rightButton() {
        if tappedView == firstView {
            first_Left_Right += 10
            firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat(first_Left_Right)).isActive = true
        } else if tappedView == secondView {
            second_Left_Right += 10
            secondView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: CGFloat(second_Left_Right)).isActive = true
        } else {
            alert(title: "Warning", message: "Pick one of the Square")
        }
    }
    
    @objc func sliderInAction (sender: UISlider) {
        if tappedView == firstView {
//            firstView.heightAnchor.constraint(equalToConstant: CGFloat(sender.value),
//            firstView.widthAnchor.constraint(equalToConstant: CGFloat(sender.value),
            
        } else if tappedView == secondView {
//          secondView.heightAnchor.constraint(equalToConstant: CGFloat(sender.value),
//          secondView.widthAnchor.constraint(equalToConstant: CGFloat(sender.value),
        } else {
            alert(title: "Warning", message: "Pick one of the Square")
        }
        
    }
   
 


}

