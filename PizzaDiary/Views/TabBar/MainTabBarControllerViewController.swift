//
//  MainTabBarControllerViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 7/30/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let pizzaList = PizzaListTableViewController()
        let pizzaMap = PizzaMapViewController()

        let listIcon = UITabBarItem(title: "List", image: UIImage(systemName: "list.bullet"), tag: 1)
        let pizzaIcon = UITabBarItem(title: "PizzaMap", image: UIImage(systemName: "map"), tag: 2)

        pizzaList.tabBarItem = listIcon
        pizzaMap.tabBarItem = pizzaIcon

        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()


        let controllers = [pizzaList, pizzaMap]

        // Mapping the view controllers into a nav controller
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
      //  self.viewControllers = controllers
    }

}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
