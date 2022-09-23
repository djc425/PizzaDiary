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

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
