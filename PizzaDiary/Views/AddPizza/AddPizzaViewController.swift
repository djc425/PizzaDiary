//
//  AddPizzaViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 11/10/22.
//

import UIKit

class AddPizzaViewController: UIViewController {

    let addProfileView = AddProfileView()



    private let feedback = UISelectionFeedbackGenerator()
    


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New Profile"
        // Do any additional setup after loading the view.



    }

    @objc func buttonTest(){
        print("Hello")
    }



}

extension AddPizzaViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        view.addSubview(addProfileView)

       // addProfileView.starRatingStackView.addGestureRecognizer(tapGestureOnStack)
        //addProfileView.saveButton.addTarget(self, action: #selector(buttonTest), for: .touchUpInside)

        NSLayoutConstraint.activate([
            addProfileView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            addProfileView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            addProfileView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            addProfileView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

        ])
    }
}
