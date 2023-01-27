//
//  PizzaModel.swift
//  PizzaDiary
//
//  Created by David Chester on 9/23/22.
//

import Foundation
import UIKit
import CoreLocation

struct PizzaModel {
    var title: String
    var image: UIImage?
    var url: String
    var notes: String
    var location: CLLocation
    var address: String

    var isFavorite: Bool = false
    var routeWith: Bool = false
}
