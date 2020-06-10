//
//  ViewController.swift
//  Homework 38
//
//  Created by Luka Alimbarashvili on 6/10/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    let canvas = Canvas()
    
    let undoButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc func handleUndo() {
        canvas.undo()
    }
    
    let clearButton : UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Clear", for: .normal)
         button.titleLabel?.font = .boldSystemFont(ofSize: 14)
         button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
         return button
     }()
    
    @objc func handleClear() {
        canvas.clear()
    }
    
    let blackButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleSliderChange), for: .touchUpInside)
        return slider
    }()
    
    @objc func handleSliderChange() {
        canvas.setStrokeWidth(width: slider.value)
    }
    
    @objc func handleColorChange(button: UIButton) {
        canvas.setColor(color: button.backgroundColor ?? .black)
        
    }
    
    
    override func loadView() {
        self.view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.backgroundColor = .white
        
        setupLayout()
    }
    
    func setupLayout() {
        let colorsStackView = UIStackView(arrangedSubviews: [
        blackButton,
        redButton,
        greenButton
        ])
        colorsStackView.distribution = .fillEqually
        
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton,
            colorsStackView,
            slider
        ])
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant:  -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

