//
//  PizzaPlace+CoreDataProperties.swift
//  PizzaDiary
//
//  Created by David Chester on 11/27/22.
//
//

import Foundation
import CoreData


extension PizzaPlace {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PizzaPlace> {
        return NSFetchRequest<PizzaPlace>(entityName: "PizzaPlace")
    }

    @NSManaged public var title: String?
    @NSManaged public var createdAt: Date?

}

extension PizzaPlace : Identifiable {

}
