//
//  GradingMethod.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 07/09/2021.
//

import Foundation

struct GradingMethod {
    
    static let percentageGrade = GradingMethod()
    
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
    
    let name: String
    let countries: [String]
    let thresholds: [String: Double]?
    private var numericRange: ClosedRange<Double>?
    private(set) var converter: ((String) -> RangeOrEquality)
    private(set) var inverseConverter: ((Double) -> String)
    
    init(_ name: String, countries: [String], with thresholds: [String: Double]) {
        self.name = name
        self.countries = countries
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


//MARK: - JSON init()
fileprivate struct GradingMethodJSON: Codable {
    let name: String
    let countries: [String]
    let thresholds: [String: Double]
}


extension GradingMethod {
        init(with jsonName: String) {
            if let targetFileURL = Bundle.main.url(forResource: jsonName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: targetFileURL)
                    let decoder = JSONDecoder()
                    let gradingMethodJSON = try decoder.decode(GradingMethodJSON.self, from: data)
                    self.init(gradingMethodJSON.name, countries: gradingMethodJSON.countries, with: gradingMethodJSON.thresholds)
                    return
                } catch {
                    print(error)
                }
            }
            self.init()
        }
}


//MARK: - Percentage init()
extension GradingMethod {
    
    private init() {
        self.name = "Percentage Grade"
        self.countries = ["Universal"]
        self.numericRange = 0.0...100.0
        self.thresholds = nil
        self.converter = GradingMethod.percentageConverter
        self.inverseConverter = GradingMethod.inversePercentageConverter
    }
    
    static func percentageConverter(_ grade: String) -> RangeOrEquality {
        return RangeOrEquality(equality: Double(grade)!)
    }
    
    static func inversePercentageConverter(_ percentage: Double) -> String {
        return String(percentage)
    }
}
