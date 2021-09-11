//
//  Assessment.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation

class Assessment: Task {
    var grade: Grade? { get { return _grade }
        set { _grade = newValue }
    }
    private var _grade: Grade?
    var weight: Double?
    var isGraded: Bool { if grade != nil {return true} else {return false} }
    var tasks = [Task]()
    
    func add(task: Task) throws {
        try validate(task: task)
        tasks.append(task)
    }
}

extension Array where Element == Assessment {
    var cumulativeWeight: Double {
            guard !self.isEmpty else {
                return 0.0
            }
            return self.map {
                return $0.weight!
            }.reduce(0.0, +)
        }
    
    var isValidAssessmentStructure: Bool { return cumulativeWeight == 1.0 }
    
    func weightedGrade(gradingStyle: GradingStyle = .percentage) -> Grade {
        var sum = 0.0
        for assessment in self {
            if let weight = assessment.weight, let grade = assessment.grade {
                sum += weight * grade.percentage
            }
        }
        return Grade(percentage: sum, style: gradingStyle)
    }
}
