//
//  CompanyTableViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 5/2/21.
//

import UIKit

protocol CompanyDelegateProtocol: AnyObject {
    func choosenCompanyDelegate(_ company: String)
}

class CompanyTableViewController: UITableViewController {
    let companyModel = CompanyModel(serviceCoreData: CoreDataService())
    var workerTableViewController: WorkerTableViewController?
    weak var delegate: CompanyDelegateProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyModel.companyArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath)
        let company = companyModel.companyArray[indexPath.row]
        cell.textLabel?.text = company.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let company = companyModel.companyArray[indexPath.row]
        delegate?.choosenCompanyDelegate(company.name ?? "No company")
        dismiss(animated: true, completion: nil)
    }
}
