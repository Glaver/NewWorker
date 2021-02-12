//
//  WorkerDTO.swift
//  NewWorker
//
//  Created by Vladyslav on 8/2/21.
//

import Foundation

struct WorkerDTO {
    let avatarImage: Data?
    let company: String?
    let dateOfBirth: Date?
    let firstName: String?
    let lastName: String?
}

struct CompanyDTO {
    let name: String
}
