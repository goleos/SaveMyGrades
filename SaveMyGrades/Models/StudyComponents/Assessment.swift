//
//  AssessmentComponent.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 01/09/2021.
//

import Foundation

//protocol AggregateComponent {
//    var componentStructure: [Component] { get }
//    var averageToDate: Grade { get }
//    var worstPredictedGrade: Grade { get }
//    var bestPredictedGrade: Grade { get }
//    var overallGrade: Grade { get }
//}



class Assessment: StudyComponent {
    
    var componentState: AssessmentComponentState = .due
    
    private var _grade: Grade?
    
    var grade: Grade? { get {
        return _grade
    } set {
        if newValue != nil {
        componentState = AssessmentComponentState.graded
        _grade = newValue
        } else {
            componentState = AssessmentComponentState.due
            _grade = nil
        }
    }}
    
    var deadline: Date? = nil
    
    //TODO: - Use colour coding to indicate different weights in the module
    
}

