//
//  WorkerViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 12/2/21.
//

import UIKit

class WorkerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var workerTableView: UITableView!
    @IBAction func addNewWorker(_ sender: UIBarButtonItem) { }
    let workerModel = WorkerModel(serviceCoreData: CoreDataService())
    var workerArray: [WorkerEntity] { return workerModel.workerArray }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkerCell", for: indexPath)
        let worker = workerArray[indexPath.row]
        cell.textLabel?.text = (worker.firstName ?? " ") + " " + (worker.lastName ?? " ")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let workerDetailVC = storyboard.instantiateViewController(withIdentifier: "WorkerDetailViewController") as! WorkerDetailViewController
        
        workerDetailVC.worker = workerArray[indexPath.row]
        self.navigationController?.pushViewController(workerDetailVC, animated: true)
    }
    //MARK: - Delete worker
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            workerModel.serviceCoreData?.deleteEntity("WorkerEntity", format: "firstName", nameToDelete: workerArray[indexPath.row].firstName!)
            //print("Delete: " + (workerArray[indexPath.row].firstName ?? " "))
            self.workerTableView.reloadData()
        }
    }
}
