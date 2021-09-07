//
//  LetterGrade.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 02/09/2021.
//

import Foundation
import UIKit

struct GradingMethod {
    
    static let percentageGrade = GradingMethod(numericRange: 0.0...100.0) {
        return RangeOrEquality(equality: Double($0)!)
    } inverseConverter: {
        return String($0)
    }
    
    static let UKDegreeClassification = GradingMethod(with: [
        "First Class": 70,
        "Upper Second Class": 60,
        "Lower Second Class": 50,
        "Third Class": 40,
        "Fail": 0
    ])

    
    struct RangeOrEquality {
        let lowerBound: Double
        let upperBound: Double
        
        init(lowerBound: Double, upperBound: Double) {
            self.lowerBound = lowerBound
            self.upperBound = upperBound
        }
        
        init(equality value: Double) {
            self.lowerBound = value
            self.upperBound = value
        }
        
        func contains(_ value: Double) -> Bool {
            if self.lowerBound == self.upperBound {
                return self.lowerBound == value
            } else {
                return (lowerBound..<upperBound).contains(value)
            }
        }
    }
    
    private let thresholds: [String: Double]?
    let numericRange: ClosedRange<Double>?
    
    let converter: ((String) -> RangeOrEquality)
    let inverseConverter: ((Double) -> String)
    
    init(with jsonName: String) {
        let targetFile = FileManager.default.currentDirectoryPath.appe
        let targetThresholds = try JSONSerialization.jsonObject(with: <#T##Data#>, options: <#T##JSONSerialization.ReadingOptions#>)
    }
    
    init(with thresholds: [String: Double]) {
        self.numericRange = nil
        self.thresholds = thresholds
        func possiblePercentageRange(_ grade: String) -> RangeOrEquality {
            let lowerBound = thresholds[grade]!
            let higherMarks = thresholds.values.filter {
                return $0 > lowerBound
            }
            let upperBound = higherMarks.isEmpty ? 100.0: higherMarks.min()!
            return RangeOrEquality(lowerBound: lowerBound, upperBound: upperBound)
        }
        func inverseFromPercentage(_ percentageGradeValue: Double) -> String {
            let possibleGrades = thresholds.values
            let smallerGrades = possibleGrades.filter {
                $0 <= percentageGradeValue
            }
            let targetGradeValue = smallerGrades.max()!
            let targetGradeName = thresholds.filter {
                return $0.value == targetGradeValue
            }.first!.key
            return targetGradeName
            
        }
        self.converter = possiblePercentageRange
        self.inverseConverter = inverseFromPercentage
        
        
    }
    
    init(numericRange: ClosedRange<Double>, converter: @escaping ((String) -> RangeOrEquality), inverseConverter: @escaping ((Double) -> String)) {
        self.thresholds = nil
        self.numericRange = numericRange
        self.converter = converter
        self.inverseConverter = inverseConverter
    }
    
    func isValidGradeString(_ grade: String) -> Bool {
        if let range = numericRange {
            guard let numericGrade = Double(grade) else {
                return false
            }
            guard range.contains(numericGrade) else {
                return false
            }
        } else {
            guard thresholds!.keys.contains(grade) else {
                return false
            }
        }
        return true
    }
        
}


struct Grade {
        
    let value: String
    let gradingMethod: GradingMethod
    let allowedPercentageRange: GradingMethod.RangeOrEquality
    var percentageGradeValue: Double
    
    init(_ rawValue: String, gradingMethod: GradingMethod = .percentageGrade) throws {
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



