//
//  CompanyModel.swift
//  NewWorker
//
//  Created by Vladyslav on 12/2/21.
//

import Foundation

class CompanyModel {
    var serviceCoreData: CompanyCoreDataServiceProtocol?
    var companyArray: [CompanyEntity] {
            return serviceCoreData?.fetchCompany() ?? [CompanyEntity]()
    }
    init(serviceCoreData: CompanyCoreDataServiceProtocol) {
        self.serviceCoreData = serviceCoreData
    }
}
