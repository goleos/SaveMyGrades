//
//  GradeError.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 06/09/2021.
//

import Foundation

enum GradingError: Error {
    case stringIsNotANumber
    case percentageOver100
    case percentageIsNegative
    case invalidGrade
    case percentageOutOfRange
}
