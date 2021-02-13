//
//  CompanyTableViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 5/2/21.
//

import UIKit


class CompanyTableViewController: UITableViewController {
    let companyModel = CompanyModel(serviceCoreData: CoreDataService())
    
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
        if let vc = presentingViewController as? WorkerTableViewController {
            let choosenCompany = companyModel.companyArray[indexPath.row]
            dismiss(animated: true) {
                vc.choosenCompanyDelegate(choosenCompany.name ?? "")
            }
        }
    }
}
