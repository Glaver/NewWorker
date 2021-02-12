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
    func fetchWorker() -> [WorkerEntity]
}

protocol CompanyCoreDataServiceProtocol {
    func saveCompany(_ newCompany: CompanyDTO)
    func fetchCompany() -> [CompanyEntity]
}

class CoreDataService: WorkerCoreDataServiceProtocol, CompanyCoreDataServiceProtocol {
   //MARK: - Save Worker to CoreData
    func saveWorker(_ newWorker: WorkerDTO) {
        guard let appDeleagate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDeleagate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "WorkerEntity", in: managedContext) else { return }
        
        let workerObject = WorkerEntity(entity: entity, insertInto: managedContext)
        workerObject.imageData = newWorker.avatarImage
        workerObject.company = newWorker.company
        workerObject.dateOfBirth = newWorker.dateOfBirth
        workerObject.firstName = newWorker.firstName
        workerObject.lastName = newWorker.lastName
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save worker to CoreData :" + error.localizedDescription)
        }
    }
    //MARK: - Save Company to CoreData
    func saveCompany(_ newCompany: CompanyDTO) {
        guard let appDeleagate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDeleagate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "CompanyEntity", in: managedContext) else { return }
        
        let companyObject = CompanyEntity(entity: entity, insertInto: managedContext)
        companyObject.name = newCompany.name
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save company to CoreData :" + error.localizedDescription)
        }
    }
    //MARK: - Fetch Company from CoreData
    func fetchCompany() -> [CompanyEntity] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [CompanyEntity]()}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<CompanyEntity> = CompanyEntity.fetchRequest()
        var companyEntityArray = [CompanyEntity]()
        do {
            companyEntityArray = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return companyEntityArray
    }
    //MARK: - Fetch Worker from CoreData
    func fetchWorker() -> [WorkerEntity] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [WorkerEntity]()}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<WorkerEntity> = WorkerEntity.fetchRequest()
        var companyEntityArray = [WorkerEntity]()
        do {
            companyEntityArray = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return companyEntityArray
    }
}
