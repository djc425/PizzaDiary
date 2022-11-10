//
//  PizzaMapViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 7/30/22.
//

import UIKit
import MapKit

class PizzaMapViewController: UIViewController, MKMapViewDelegate {

    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension PizzaMapViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        title = "Pizza Map"

        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isZoomEnabled = true


        view.addSubview(mapView)

        NSLayoutConstraint.activate([

            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
