//
//  ViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 1/2/21.
//

import UIKit

class NewWorkerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
//
//    let tableViewController = UITableViewController(style: .plain)
//
//    var allCells = ["Avatar", "FirstName", "LastName", "DateOfBirth", "Company"]
//    var cellIditifier = "Cell"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        createTableView()
//        view.addSubview(tableViewController.tableView)
//        // Do any additional setup after loading the view.
//    }
//
//    func createTableView() {
//        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIditifier)
//        tableViewController.tableView.delegate = self
//        tableViewController.tableView.dataSource = self
//    }
//}
//
//extension NewWorkerViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return allCells.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIditifier, for: indexPath)
//
//        let item = allCells[indexPath.row]
//        cell.textLabel?.text = item
//
//        return cell
//    }
//}

















