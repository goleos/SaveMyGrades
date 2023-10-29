//
//  ValidationError.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 07/09/2021.
//

import Foundation

enum ValidationError: Error {
    case valueNotProvided(_ value: String)
    case addingIncorrectType
    case invalidWeight
    case excessiveWeightInParent
    case duplicateName
    case invalidStatus
}


