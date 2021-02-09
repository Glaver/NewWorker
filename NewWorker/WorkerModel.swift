//
//  WorkerModel.swift
//  NewWorker
//
//  Created by Vladyslav on 4/2/21.
//

import Foundation

class WorkerModel {
    var serviceCoreData: WorkerCoreDataServiceProtocol?
    
    init(serviceCoreData: WorkerCoreDataServiceProtocol) {
        self.serviceCoreData = serviceCoreData
    }
}
