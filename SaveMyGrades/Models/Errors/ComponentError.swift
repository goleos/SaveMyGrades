//
//  Errors.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 06/09/2021.
//

import Foundation

enum ComponentError: Error {
    case duplicateName(suggestion: String)
    case duplicateNameRefusal
    case invalidWeight
    case weightNotProvided
    case gradedWithNoGrade
    case missingComponentState
    case assessmentNameTooShort
    case moduleNameTooShort
    case weightDoesNotFit
}

