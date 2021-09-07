//
//  ValidationMethods.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 07/09/2021.
//

import Foundation

struct ValidationMethods {
    
    static func weightIsBetween0And1(_ weight: Double) throws {
        guard weight >= 0.0 else {
            throw ValidationError.weightIsNegative
        }
        guard weight <= 100 else {
            throw ValidationError.weightIsOver1
        }
    }
    
    static func weightIsNotExcessiveInAssessmentStructure(_ weight: Double, _ parent: AggregationComponent) throws {
        guard (parent.cumulativeWeightOfComponents + weight) <= 1.0 else {
            throw ValidationError.excessiveWeightInParent
        }
    }
    
    static func stringIsANumber(_ string: String) throws -> Double {
        guard let percentage = Double(string) else {
            throw ValidationError.stringIsNotANumber
        }
        return percentage
    }
    
    static func validPercentageGradeStringValue(_ value: String) throws {
        let doubleValue = try stringIsANumber(value)
        guard doubleValue > 0.0 else {
            throw ValidationError.percentageGradeIsNegative
        }
        guard doubleValue <= 100 else {
            throw ValidationError.percentageGradeIsOver100
        }
    }
    
    static func noDuplicateNameInParent(_ name: String, _ parent: AggregationComponent) throws {
        let componentNames = parent.assessmentStructure.map {
            return $0.name
        }
        guard !(componentNames.contains(name)) else {
            throw ValidationError.duplicateName
        }
    }
}


enum ValidationError: Error {
    case weightIsNegative
    case weightIsOver1
    case stringIsNotANumber
    case percentageGradeIsNegative
    case percentageGradeIsOver100
    case excessiveWeightInParent
    case duplicateName
}


