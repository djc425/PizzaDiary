//
//  ViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 2/27/22.
//

import UIKit

class PizzaIntroViewController: UIViewController {

    let pizzaIntroView = PizzaIntroView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemOrange

        pizzaIntroView.nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    }
    
    @objc func nextPage(){
        let mainTab = MainTabBarController()

        
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .green
        view.addSubview(pizzaIntroView)

        NSLayoutConstraint.activate([
            pizzaIntroView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            pizzaIntroView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pizzaIntroView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pizzaIntroView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }


}

