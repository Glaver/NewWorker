//
//  WorkerViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 12/2/21.
//

import UIKit

class WorkerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var workerTableView: UITableView!
    let workerModel = WorkerModel(serviceCoreData: CoreDataService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workerModel.workerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkerCell", for: indexPath)
        let worker = workerModel.workerArray[indexPath.row]
        cell.textLabel?.text = (worker.firstName ?? " ") + " " + (worker.lastName ?? " ")
        // MARK: Refactor optional
        return cell
    }
}
