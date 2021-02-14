//
//  WorkerDetailViewController.swift
//  NewWorker
//
//  Created by Vladyslav on 13/2/21.
//

import UIKit

class WorkerDetailViewController: UIViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var dayOfBirth: UILabel!
    @IBOutlet weak var company: UILabel!
    var worker = WorkerEntity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatarImage.image = worker.imageData != nil ? UIImage(data: worker.imageData!) : UIImage(named: "blur")!
        self.firstName.text = worker.firstName
        self.lastName.text = worker.lastName
        self.dayOfBirth.text = worker.dateOfBirth != nil ? DateFormattingHelper.shared.printFormattedDate(worker.dateOfBirth!, printFormat: "MMM dd,yyyy") : "No date"
        self.company.text = worker.company
    }

}
