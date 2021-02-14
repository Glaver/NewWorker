//
//  WorkerModel.swift
//  NewWorker
//
//  Created by Vladyslav on 4/2/21.
//

import Foundation

class WorkerModel {
    var serviceCoreData: WorkerCoreDataServiceProtocol?
    var workerArray: [WorkerEntity] {
        return serviceCoreData?.fetchWorker() ?? [WorkerEntity]()
    }
    init(serviceCoreData: WorkerCoreDataServiceProtocol) {
        self.serviceCoreData = serviceCoreData
    }
}
