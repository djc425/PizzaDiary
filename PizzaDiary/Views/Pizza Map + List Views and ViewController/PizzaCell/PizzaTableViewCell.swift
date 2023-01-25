//
//  PizzaTableViewCell.swift
//  PizzaDiary
//
//  Created by David Chester on 1/25/23.
//

import UIKit

class PizzaTableViewCell: UITableViewCell {


    static let identifer = "pizzaCell"

    //TODO: add the below, use Mayday as a reference
    /*
    var pizzaInfo: PizzaPlace? {
        didSet {

        }
    }
     */

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //TODO: Create Cell Properties

    private var pizzaIcon: UIImageView = {
        let pizzaIcon = UIImageView()
        pizzaIcon.image = UIImage(named: "pizzaIcon")

        pizzaIcon.translatesAutoresizingMaskIntoConstraints = false
        return pizzaIcon
    }()

    private let restaurantName: UILabel = {
        let rn = UILabel()


        return rn
    }()

}
