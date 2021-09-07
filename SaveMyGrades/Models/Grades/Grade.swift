//
//  LetterGrade.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 02/09/2021.
//

import Foundation



struct Grade {
        
    let value: String
    let gradingMethod: GradingMethod
    let allowedPercentageRange: GradingMethod.RangeOrEquality
    var percentageGradeValue: Double
    
    init(_ rawValue: String, gradingMethod: GradingMethod = .percentageGrade) throws {
        if gradingMethod.name == GradingMethod.percentageGrade.name {
        try ValidationMethods.validPercentageGradeStringValue(rawValue)
        }
        guard gradingMethod.isValidGradeString(rawValue) else {
            throw GradingError.invalidGrade
        }
        self.value = rawValue
        self.gradingMethod = gradingMethod
        allowedPercentageRange = self.gradingMethod.converter(rawValue)
        self.percentageGradeValue = (allowedPercentageRange.lowerBound + allowedPercentageRange.upperBound) / 2
    }
    
    mutating func setPercentageGrade(_ value: Double) throws {
        guard allowedPercentageRange.contains(value) else {
            throw GradingError.percentageOutOfRange
        }
        self.percentageGradeValue = value
    }
    
    
    static func average(from array: [Grade], showAs gradingMethod: GradingMethod = .percentageGrade) -> Grade {
        var percentageGradeTotal = 0.0
        for grade in array {
            percentageGradeTotal += grade.percentageGradeValue
        }
        let percentageGradeAverage = percentageGradeTotal / Double(array.count)
        let resultingGradeString = gradingMethod.inverseConverter(percentageGradeAverage)
        return try! Grade(resultingGradeString, gradingMethod: gradingMethod)
    }
    
    
}



