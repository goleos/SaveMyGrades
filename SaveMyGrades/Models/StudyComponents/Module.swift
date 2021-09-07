//
//  Module.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 01/09/2021.
//

import Foundation

class Module: StudyComponent, AggregationComponent {
    var assessmentStructure: [StudyComponent] = []
    
    var cumulativeWeightOfComponents: Double {
        guard !assessmentStructure.isEmpty else {
            return 0.0
        }
        return assessmentStructure.map {
            return $0.weight
        }.reduce(0.0, +)
    }
    
    
    var componentState: ModuleComponentState = .notCompleted
    var displayGradingMethod: GradingMethod = .percentageGrade
    
    var description: String?
            
    var averageToDate: Grade? {
        let existingGrades = assessmentStructure.filter { assessment in
            if (assessment as! Assessment).grade != nil {
                return true
            } else {
                return false
            }
        }
        return Grade.average(from: existingGrades.map({
            return ($0 as! Assessment).grade!
        }), showAs: displayGradingMethod)
    }
        
    override func validate(addToParent: Bool = false) throws {
        guard !((componentState.name == ModuleComponentState.graded.name) && (averageToDate == nil)) else {
            throw ComponentError.gradedWithNoGrade
        }
        try super.validate()
    }
    
}


