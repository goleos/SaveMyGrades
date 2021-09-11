//
//  Module.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation

class Module: Assessment {
    var gradeableComponents = [Assessment]()
    var startDate: Date?
    
    var gradedComponents: [Assessment] {
        return gradeableComponents.filter { assessment in
            return assessment.isGraded } }
    
    var cumulativeWeightOfAllComponents: Double {
        guard !gradeableComponents.isEmpty else {
            return 0.0
        }
        return gradeableComponents.map {
            return $0.weight!
        }.reduce(0.0, +)
    }
    
    var cumulativeGrade: Grade { gradeableComponents.weightedGrade() }
    
    override var grade: Grade? { get { Grade(percentage: (cumulativeGrade.percentage / cumulativeWeightOfAllComponents))}
        @available(*, unavailable)
        set { }
    }
    
    override func add(task: Task) throws {
        guard !(task.statusList[0].type == Task.self) else {
            try super.add(task: task)
            return
        }
        try validate(task: task)
        gradeableComponents.append(task as! Assessment)
    }
    
    func add(assessment: Assessment) throws {
        try add(task: assessment)
    }
    
}


