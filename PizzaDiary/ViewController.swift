//
//  ViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 2/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    let introView = UIView()
    var introLabel: UILabel!
    var descriptionLabel: UILabel!
    
    let button = UIButton(type: .system)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .green
        
        introLabel = UILabel()
        introLabel.text = "Welcome to Pizza Diary"
        introLabel.textAlignment = .center
        introLabel.font = UIFont.systemFont(ofSize: 24)
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        introView.addSubview(introLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "In pizza diary you can track your favorite slices, pies, squares and more. Just take a picture to document your favorites and fill out the optional profile to add them to your pizza map"
        descriptionLabel.numberOfLines = 7
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .center
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        introLabel.addSubview(descriptionLabel)
        
        
        introView.translatesAutoresizingMaskIntoConstraints = false
        introView.backgroundColor = .systemRed
        view.addSubview(introView)
        
        
        button.setTitle("Lets start documenting", for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        
        NSLayoutConstraint.activate([
        
            introLabel.topAnchor.constraint(equalTo: introView.topAnchor),
            introLabel.centerXAnchor.constraint(equalTo: introView.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: introView.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: introView.leadingAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: introView.centerXAnchor),
            
            
            introView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 100),
            introView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.4),
            introView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
            introView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -200),
            button.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
        
        
        
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
    

        title = "Intro"
        
    }
    
    @objc func nextPage(){
        let rootVC = PizzaListTableViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }


}

