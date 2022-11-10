//
//  PizzaAnnotation.swift
//  PizzaDiary
//
//  Created by David Chester on 9/23/22.
//

import Foundation
import MapKit

class PizzaAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var locationName: String?

    init?(title: String?, coordinate: CLLocationCoordinate2D, locationName: String?) {
            self.coordinate = coordinate
            self.title = title
            self.locationName = locationName
        }

    

}
