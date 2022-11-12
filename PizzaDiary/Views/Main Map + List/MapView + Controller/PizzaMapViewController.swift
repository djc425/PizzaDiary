//
//  PizzaMapViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 7/30/22.
//

import UIKit


class PizzaMapViewController: UIViewController {

    let mapView = PizzaMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza Map"

        // Do any additional setup after loading the view.
    }


}

extension PizzaMapViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(mapView)

        NSLayoutConstraint.activate([

            mapView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }
}
