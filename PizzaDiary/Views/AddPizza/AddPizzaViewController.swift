//
//  AddPizzaViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 11/10/22.
//

import UIKit

class AddPizzaViewController: UIViewController {

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
    }
}
