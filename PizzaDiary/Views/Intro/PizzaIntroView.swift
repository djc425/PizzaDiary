//
//  PizzaIntroView.swift
//  PizzaDiary
//
//  Created by David Chester on 7/30/22.
//

import Foundation
import UIKit

class PizzaIntroView: UIView {

    // MARK: Labels View
    fileprivate lazy var introLabelsView: UIView = {
        let introView =  UIView()
        introView.translatesAutoresizingMaskIntoConstraints = false
         introView.backgroundColor = .systemRed.withAlphaComponent(0.6)
        introView.layer.cornerRadius = 20
        return introView
    }()

    // MARK: Labels
     fileprivate lazy var introLabel: UILabel = {
        let introLabel = UILabel()
        introLabel.text = "Welcome to Pizza Diary"
        introLabel.textAlignment = .center
        introLabel.font = UIFont.systemFont(ofSize: 24)
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        return introLabel
    }()

    fileprivate lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "In pizza diary you can track your favorite slices, pies, squares and more. Just take a picture to document your favorites and fill out the optional profile to add them to your pizza map"
        descriptionLabel.numberOfLines = 7
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .center
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        return descriptionLabel
    }()

    // MARK: Next Button
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start documenting", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .darkGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        return button
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: Configure Function
    // For view setup
   private func configure() {
       self.translatesAutoresizingMaskIntoConstraints = false
       self.addSubview(introLabelsView)
       // add the two labels into the one view
       introLabelsView.addSubview(introLabel)
       introLabelsView.addSubview(descriptionLabel)
       // add nextButton
       self.addSubview(nextButton)

       //Constraints
       NSLayoutConstraint.activate([
        introLabelsView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
        introLabelsView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
        introLabelsView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
        introLabelsView.centerXAnchor.constraint(equalTo: centerXAnchor),

        introLabel.topAnchor.constraint(equalTo: introLabelsView.topAnchor),
        introLabel.centerXAnchor.constraint(equalTo: introLabelsView.centerXAnchor),

        descriptionLabel.topAnchor.constraint(equalTo: introLabelsView.centerYAnchor, constant: -20),
        descriptionLabel.trailingAnchor.constraint(equalTo: introLabelsView.trailingAnchor, constant: -5),
        descriptionLabel.leadingAnchor.constraint(equalTo: introLabelsView.leadingAnchor,constant: 5),
        descriptionLabel.centerXAnchor.constraint(equalTo: introLabelsView.centerXAnchor),

        nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
        nextButton.widthAnchor.constraint(equalToConstant: 185)
       ])
    }
}
