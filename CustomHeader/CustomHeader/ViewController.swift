//
//  ViewController.swift
//  CustomHeader
//
//  Created by Иван Романов on 04.08.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Data
    let cities = [
        "Alouchta",
        "Yalta",
        "Gurzuf",
        "Sudak",
        "Utes",
        "Simpheropol"
    ]
    
    // MARK: - UI Elements
    let buttonEdgeSpacing = CGFloat(10)
    let categoryButtonHeight = CGFloat(20.0)
    
    lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        
        return view
    }()
    
    lazy var topLevelHeaderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        return stackView
    }()
    
    lazy var categoryScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        
        return stackView
    }()
    
    lazy var citySelectionButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        return button
    }()
    
    lazy var categoryButtons: [UIButton] = [
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
        UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    private func setupViews() {
        
        // backView
        self.view.addSubview(backView)
        backView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        backView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Top Level Stack View
        self.backView.addSubview(topLevelHeaderStackView)
        self.topLevelHeaderStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
        self.topLevelHeaderStackView.topAnchor.constraint(equalTo: backView.topAnchor).isActive = true
        self.topLevelHeaderStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive = true
        self.topLevelHeaderStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive = true
        
        //        // scrollView
        //        self.backView.addSubview(categoryScrollView)
        //        categoryScrollView.topAnchor.constraint(equalTo: backView.topAnchor).isActive = true
        //        categoryScrollView.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
        //        categoryScrollView.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive = true
        //        categoryScrollView.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive = true
        
        topLevelHeaderStackView.addArrangedSubview(categoryScrollView)
        
        // City Picker Button
        topLevelHeaderStackView.addArrangedSubview(citySelectionButton)
        citySelectionButton.setTitle("Moscow", for: .normal)
        citySelectionButton.backgroundColor = .systemIndigo
        citySelectionButton.addTarget(self, action: #selector(revealCityPopover(_:)), for: .touchUpInside)
        //        citySelectionButton.leadingAnchor
        
        
        
        
        // Constraint Stack View to Scroll View
        self.categoryScrollView.addSubview(contentStackView)
        self.contentStackView.leadingAnchor.constraint(equalTo: categoryScrollView.leadingAnchor).isActive = true
        self.contentStackView.topAnchor.constraint(equalTo: categoryScrollView.topAnchor).isActive = true
        self.contentStackView.trailingAnchor.constraint(equalTo: categoryScrollView.trailingAnchor).isActive = true
        self.contentStackView.bottomAnchor.constraint(equalTo: categoryScrollView.bottomAnchor).isActive = true
        
        // Constraint HEIGHT of Stack View to height of Back View
        self.contentStackView.heightAnchor.constraint(equalTo: self.backView.heightAnchor).isActive = true
        
        // Add buttons to StackView
        for each in categoryButtons {
            each.backgroundColor = .orange
            each.setTitle("Button", for: .normal)
            each.contentEdgeInsets = UIEdgeInsets(top: 0, left: buttonEdgeSpacing, bottom: 0, right: buttonEdgeSpacing)
            
            self.contentStackView.addArrangedSubview(each)
        }
        
    }
    
    
    
    
}

// MARK:- Popover Stuff
extension ViewController {
    
    @objc private func revealCityPopover(_ sender: UIButton) {
        let controller = ArrayChoiceTableViewController(self.cities) { (name) in
            print("\(name) selected")
        }
        
        controller.preferredContentSize = CGSize(width: 300, height: 200)
        showPopup(controller, sourceView: sender)
    }
    
    private func showPopup(_ controller: UIViewController, sourceView: UIView) {
        let presentationController = AlwaysPresentAsPopover.configurePresentation(forController: controller)
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = [.down, .up]
        self.present(controller, animated: true)
    }
}


