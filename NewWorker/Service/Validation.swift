//
//  Validation.swift
//  NewWorker
//
//  Created by Vladyslav on 9/2/21.
//

import Foundation

let minLenghtOfTextField = 2
let maxLenghtOfTextField = 25
let maxAge = 60
let minAge = 16
let defaultValueLabelCompany = "Choose company"

@propertyWrapper
struct Validate <Value> {
    var value: Value?
    var validations: [(Value?) -> Bool] = []
    
    var wrappedValue: Value? {
        get {
            let checkValidations = validations.reduce(true) { (result, function) in
                return result && function(value)
            }
            guard checkValidations else {
                return nil
            }
            return value
        }
        set {
            value = newValue
        }
    }
    
    init(initialValue value: Value?, validations: [(Value?) -> Bool]) {
        self.value = value
        self.validations = validations
    }
}

struct UserNameLengthValidator {
    func execute(name: String?) -> Bool {
        guard let username = name,
            username.count > minLenghtOfTextField && username.count < maxLenghtOfTextField else { return false }
        return true
    }
}

struct UserForm {
    enum UserError: Error, Equatable {
        case noValidUser
    }
    
    @Validate(initialValue: nil, validations: [UserNameLengthValidator().execute])
    private var nameField: String?
    
    var validate: Result<String, UserError> {
        guard let name = nameField else {
            return .failure(.noValidUser)
        }
        return .success(.init(name))
    }
    
    init(name: String) {
        self.nameField = name
    }
}

class Validation {
    static func forCompanyLabel(_ company: String) -> (isValidate: Bool, message: String) {
        var validationFlag: Bool
        var errorMessage = ""
        if company != defaultValueLabelCompany {
            errorMessage = ""
            validationFlag = true
        } else {
            validationFlag = false
            errorMessage = " Forget to choose your company."
        }
        return (isValidate: validationFlag, message: errorMessage)
    }
    
    static func forTextFiled(_ userForm: String, nameTextField: String) -> (isValidate: Bool, message: String) {
        let userForm = UserForm(name: userForm)
        var validationFlag = false
        var validationErrorMassage = ""
        switch userForm.validate {
        case .success:
            validationFlag = true
        //print("Success")
        case .failure: //(let error)
            validationFlag = false
            validationErrorMassage += " Invalid input for \(nameTextField)."
        //print(validationErrorMassage)
        }
        return (validationFlag, validationErrorMassage)
    }
    
    static func forDatePicker(_ datePicker: Date) -> (isValidate: Bool, message: String) {
        let minimumAge: Date = Calendar.current.date(byAdding: .year, value: -minAge, to: Date())!
        let maximumAge: Date = Calendar.current.date(byAdding: .year, value: -maxAge, to: Date())!
        var isValid: Bool = true
        var errorMessage = ""
        if datePicker < maximumAge || datePicker > minimumAge {
            isValid = false; errorMessage = "You can't work because of age"
        }
        return (isValidate: isValid, message: errorMessage)
    }
}
