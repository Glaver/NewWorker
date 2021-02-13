//
//  CompanyViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 12/2/21.
//

import UIKit

class CompanyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func addCompany(_ sender: UIBarButtonItem) {
        showAddCompanyTextField()
        self.companyTableView.reloadData()
    }
    @IBOutlet weak var companyTableView: UITableView!
    
    let companyModel = CompanyModel(serviceCoreData: CoreDataService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyModel.companyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath)
        let company = companyModel.companyArray[indexPath.row]
        cell.textLabel?.text = company.name
        return cell
    }
    
    private func showAddCompanyTextField() {
        let alert = UIAlertController(title: "Add new company", message: nil, preferredStyle: .alert)
        alert.addTextField()

        let submitAction = UIAlertAction(title: "Save", style: .default) { [unowned alert] _ in
            let inputTextData = alert.textFields![0]
            if let outputTextField = inputTextData.text {
                self.companyModel.serviceCoreData?.saveCompany(CompanyDTO(name: outputTextField))
                print(outputTextField + " is saved to core data")
            }
        }
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
}
