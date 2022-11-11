//
//  AddPizzaViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 11/10/22.
//

import UIKit

class AddPizzaViewController: UIViewController {

    let addProfileView = AddProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New Profile"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddPizzaViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        view.addSubview(addProfileView)

        NSLayoutConstraint.activate([
            addProfileView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            addProfileView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            addProfileView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            addProfileView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

        ])
    }
}
