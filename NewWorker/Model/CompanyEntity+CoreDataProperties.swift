//
//  CompanyEntity+CoreDataProperties.swift
//  NewWorker
//
//  Created by Vladyslav on 12/2/21.
//
//

import Foundation
import CoreData


extension CompanyEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompanyEntity> {
        return NSFetchRequest<CompanyEntity>(entityName: "CompanyEntity")
    }

    @NSManaged public var name: String?

}

extension CompanyEntity : Identifiable {

}
