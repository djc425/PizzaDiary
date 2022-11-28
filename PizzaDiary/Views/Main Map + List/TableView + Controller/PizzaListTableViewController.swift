//
//  PizzaListTableViewController.swift
//  PizzaDiary
//
//  Created by David Chester on 2/28/22.
//

import UIKit

class PizzaListTableViewController: UIViewController {

    let pizzaTableView = PizzaTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // view.backgroundColor = .cyan
        title = "Pizza List"

        pizzaTableView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PizzaCell")
        pizzaTableView.tableView.delegate = self
        pizzaTableView.tableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPizza))
        
    }
    
    @objc func addNewPizza() {
        print("its me pizza")
        navigationController?.pushViewController(AddPizzaViewController(), animated: true)
    }

}


extension PizzaListTableViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCell", for: indexPath)

        var content = cell.defaultContentConfiguration()

        content.text = "this is cell \(indexPath.row)"

        cell.contentConfiguration = content

        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}

extension PizzaListTableViewController {
    override func loadView() {
        view = UIView()
        view.addSubview(pizzaTableView)
        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            pizzaTableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            pizzaTableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            pizzaTableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            pizzaTableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)

        ])

    }
}
