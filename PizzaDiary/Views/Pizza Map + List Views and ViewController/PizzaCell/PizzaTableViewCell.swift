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
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //TODO: Create Cell Properties

    private var pizzaIcon: UIImageView = {
        let pizzaIcon = UIImageView()
        pizzaIcon.image = UIImage(named: "pizzaIcon")
        pizzaIcon.contentMode = .scaleAspectFill
        pizzaIcon.layer.cornerRadius = 15
        pizzaIcon.layer.masksToBounds = true

        pizzaIcon.translatesAutoresizingMaskIntoConstraints = false
        return pizzaIcon
    }()

    private var restaurantName: UILabel = {
        let rn = UILabel()
        rn.textColor = .label
        rn.translatesAutoresizingMaskIntoConstraints = false
        rn.adjustsFontForContentSizeCategory = true

        return rn
    }()

    // TODO: Add route stuff
    var routeWithButton: UIButton = {
        var rb = UIButton(type: .custom)
        rb.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        rb.tintColor = .black
        rb.isUserInteractionEnabled = true

        rb.translatesAutoresizingMaskIntoConstraints = false
        return rb
    }()
    //Add favorite button


    // MARK: prepareForReuse
    override func prepareForReuse() {
        pizzaIcon.image = nil
    }




    //MARK: Configure Constraints
    //TODO: Set up constraints

    private func configureUI(){
        self.backgroundColor = UIColor.white.withAlphaComponent(0.5)

        contentView.addSubview(pizzaIcon)
        contentView.addSubview(restaurantName)
        contentView.addSubview(routeWithButton)

        NSLayoutConstraint.activate([
            pizzaIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            pizzaIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            pizzaIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            pizzaIcon.heightAnchor.constraint(equalTo: pizzaIcon.heightAnchor),

            restaurantName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 1),
            restaurantName.leadingAnchor.constraint(equalTo: pizzaIcon.trailingAnchor, constant: 10),
            restaurantName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            routeWithButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            routeWithButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)

        ])

    }

}
