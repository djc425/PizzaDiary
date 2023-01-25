//
//  PizzaMapView.swift
//  PizzaDiary
//
//  Created by David Chester on 11/11/22.
//

import UIKit
import MapKit


class PizzaMapView: UIView, MKMapViewDelegate {

    let mapView: MKMapView = {
        let pmv = MKMapView()

        pmv.isZoomEnabled = true
        pmv.translatesAutoresizingMaskIntoConstraints = false
        return pmv
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func configureUI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mapView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor),



        ])

    }
    

    
    

}
