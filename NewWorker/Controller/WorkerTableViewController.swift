//
//  WorkerTableViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 4/2/21.
//
import Foundation
import UIKit

class WorkerTableViewController: UITableViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var choosenCompanyLabel: UILabel!
    @IBAction func saveButton(_ sender: UIButton) {
        let firstNameData = Validation.forTextFiled(firstName.text ?? " ", nameTextField: "firstName")
        let lastNameData = Validation.forTextFiled(lastName.text ?? " ", nameTextField: "lastName")
        let companyToWork = Validation.forCompanyLabel(choosenCompanyLabel.text!)
        let datePickerValidation = Validation.forDatePicker(datePicker.date)
        if !firstNameData.isValidate || !lastNameData.isValidate || !companyToWork.isValidate || !datePickerValidation.isValidate {
            showSaveAlertWith(message: firstNameData.message + lastNameData.message + companyToWork.message + datePickerValidation.message)
        } else {
            showSaveAlertWith(message: "Worker saved") //avatarImage.image?.pngData()
            workerModel.serviceCoreData?.saveWorker(WorkerDTO(avatarImage: avatarImage.image?.pngData(),
                                                                           company: choosenCompanyLabel.text!,
                                                                           dateOfBirth: datePicker.date,
                                                                           firstName: firstName.text,
                                                                           lastName: lastName.text))
        }
    }
    
    let workerModel = WorkerModel(serviceCoreData: CoreDataService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.avatarImage.load(url: ImageAPI.url)
        }
    }
    
    private func showSaveAlertWith(message: String) {
        let alert = UIAlertController(title: "Save", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func choosenCompanyDelegate(_ company: String) {
        choosenCompanyLabel.text = company
    }
}


