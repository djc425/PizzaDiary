//
//  CoreDataStruct.swift
//  PizzaDiary
//
//  Created by David Chester on 1/25/23.
//

import Foundation
import UIKit

struct CoreDataMethods {

    // MARK: Load Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // loading the pizzaPlaces
    func getAllPizzaPlaces() -> [PizzaPlace]?{

        var pizzaPlaceArray: [PizzaPlace]?

        do {
            let pizzaPlace = try context.fetch(PizzaPlace.fetchRequest())

            pizzaPlaceArray = pizzaPlace
        } catch {
            print(error.localizedDescription)
        }

        return pizzaPlaceArray
    }

    // MARK: Create
    func createPizzaPlace(name: String){
        let newPizzaPlace = PizzaPlace(context: context)

        newPizzaPlace.title = name
        newPizzaPlace.createdAt = Date()

        do {
            try context.save()
        } catch {
        }
    }

    // MARK: Delete
    func deletePizzaPlace(_ pizzaPlace: PizzaPlace){
        context.delete(pizzaPlace)
        do {
            try context.save()
        } catch {

        }
    }

    // MARK: Update
    // TODO: Update more than just name
    func updatePizzaPlace(_ pizzaPLace: PizzaPlace, newName: String) {
        pizzaPLace.title = newName
        do {
            try context.save()
        } catch {

        }
    }
}
