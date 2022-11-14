//
//  PizzaMapViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 7/30/22.
//

import UIKit
import MapKit
import CoreLocation


class PizzaMapViewController: UIViewController {

    let mapView = PizzaMapView()

    let locationManager = LocationManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pizza Map"

        setLocation()
    }

   private func setLocation() {
       locationManager.getUserLocation { [weak self] usersLocation in
            guard let strongSelf = self else {
                return
            }
            strongSelf.addMapPin(with: usersLocation)

        }
   }


    func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        mapView.mapView.addAnnotation(pin)

       mapView.mapView.setRegion(
            MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)),
            animated: true)
    }



}


// MARK: Load View Extension
extension PizzaMapViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(mapView)

        NSLayoutConstraint.activate([

            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }
}
