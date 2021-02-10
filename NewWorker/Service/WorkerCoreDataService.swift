//
//  WorkerCoreDataService.swift
//  NewWorker
//
//  Created by Vladyslav on 8/2/21.
//

import Foundation
import CoreData
import UIKit

protocol WorkerCoreDataServiceProtocol {
    func saveWorker(_ newWorker: WorkerDTO)
}

class WorkerCoreDataService: WorkerCoreDataServiceProtocol {
    func saveWorker(_ newWorker: WorkerDTO) {
        guard let appDeleagate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDeleagate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "WorkerEntity", in: managedContext) else { return }
        
        let workerObject = WorkerEntity(entity: entity, insertInto: managedContext)
        workerObject.avatarImage = newWorker.avatarImage
        workerObject.company = newWorker.company
        workerObject.dateOfBirth = newWorker.dateOfBirth
        workerObject.firstName = newWorker.firstName
        workerObject.lastName = newWorker.lastName
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
