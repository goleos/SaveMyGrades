//
//  Assessment.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation

typealias Weight = Double

class Assessment: Task {
    private var _grade: Grade?
    var grade: Grade? { get { return _grade }
        set { _grade = newValue }
    }
    var weight: Weight?
    var isGraded: Bool { if grade != nil {return true} else {return false} }
    var tasks = [Task]()
}

extension Array where Element: Assessment {
    var cumulativeWeight: Weight {
            guard !self.isEmpty else {
                return 0.0
            }
            return self.map {
                return $0.weight!
            }.reduce(0.0, +)
        }
    
    var gradedComponents: [Assessment] {
        return self.filter { $0.isGraded }
    }

    var weightedGrade: Grade {
        var sum = 0.0
        for assessment in self {
            if let grade = assessment.grade, let weight = assessment.weight {
                sum += weight * grade.percentage
            }
        }
        return Grade(percentage: sum)
    }
    
    mutating func add(_ assessment: Assessment) throws {
        if !self.isEmpty {
            guard assessment.status.type == self[0].status.type else { throw ValidationError.addingIncorrectType }
        }
        guard let name = assessment.name else { throw ValidationError.valueNotProvided("Name") }
        guard !self.map({return $0.name}).contains(name) else { throw ValidationError.duplicateName }

        guard let weight = assessment.weight else { throw ValidationError.valueNotProvided("Weight")}
        guard (0.0...100.0).contains(weight) else { throw ValidationError.invalidWeight}
        guard cumulativeWeight + weight <= 1.0 else { throw ValidationError.excessiveWeightInParent}

        self.append(assessment as! Element)
    }
}

