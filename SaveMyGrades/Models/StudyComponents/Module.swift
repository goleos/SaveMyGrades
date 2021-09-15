//
//  Module.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation

class Module: Assessment {
    var assessments: [Assessment] { get { _components }
        set { _components = newValue }
    }
    var _components = [Assessment]()
    
    var startDate: Date?
    
    var cumulativeGrade: Grade { _components.weightedGrade }
    
    override var grade: Grade? { get {
        let gradedWeight = _components.gradedComponents.cumulativeWeight
        guard gradedWeight != 0 else {
            return nil
        }
        return Grade(percentage: (cumulativeGrade.percentage / gradedWeight))}
        @available(*, unavailable)
        set { }
    }
}
