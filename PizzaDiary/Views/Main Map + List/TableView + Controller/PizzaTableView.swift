//
//  PizzaTableView.swift
//  PizzaDiary
//
//  Created by David Chester on 11/10/22.
//

import UIKit

class PizzaTableView: UIView {

    let heroImage: UIImageView = {
        let heroImageView = UIImageView()
        heroImageView.image = UIImage(named: "pizzaIcon")

        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        return heroImageView
    }()

    let loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.style = UIActivityIndicatorView.Style.large
        spinner.color = UIColor.systemTeal
        spinner.hidesWhenStopped = true
        spinner.layer.zPosition = 1
        spinner.translatesAutoresizingMaskIntoConstraints = false

        return spinner
    }()

    let tableView: UITableView = {
        let pizzaTable = UITableView()
        pizzaTable.allowsSelection = true
        pizzaTable.separatorStyle = .singleLine


        pizzaTable.translatesAutoresizingMaskIntoConstraints = false
        return pizzaTable
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView(){
        self.backgroundColor = .clear
        self.addSubview(heroImage)
        self.addSubview(tableView)
        self.addSubview(loadingSpinner)

        tableView.backgroundColor = .blue


        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            heroImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            heroImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            heroImage.heightAnchor.constraint(equalToConstant: 100),
            heroImage.widthAnchor.constraint(equalTo: heroImage.heightAnchor),

            loadingSpinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            tableView.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 100),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

}
