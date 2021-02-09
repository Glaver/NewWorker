//
//  CompanyTableViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 5/2/21.
//

import UIKit


class CompanyTableViewController: UITableViewController {
    let avalibleCompanys = ["Apple", "Google", "IBM", "Tesla", "Microsoft"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avalibleCompanys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath)
        cell.textLabel?.text = avalibleCompanys[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = presentingViewController as? WorkerTableViewController {
            let choosenCompany = avalibleCompanys[indexPath.row]
            dismiss(animated: true) {
                vc.choosenCompanyDelegate(choosenCompany)
            }
        }
    }
}
