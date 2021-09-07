//
//  AssessmentComponentState.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 06/09/2021.
//

import Foundation

struct AssessmentComponentState: ComponentState {
    
    static let due = AssessmentComponentState(name: "Due", gradeMustBeAvailable: false)
    static let inProgress = AssessmentComponentState(name: "In Progress", gradeMustBeAvailable: false)
    static let readyToSubmit = AssessmentComponentState(name: "Ready To Submit", gradeMustBeAvailable: false)
    static let submitted = AssessmentComponentState(name: "Submitted", gradeMustBeAvailable: false)
    static let graded = AssessmentComponentState(name: "Graded", gradeMustBeAvailable: true)
    static let gradedAsLate = AssessmentComponentState(name: "Graded as Late", gradeMustBeAvailable: true)
    static let neverSubmitted = AssessmentComponentState(name: "Never Submitted", gradeMustBeAvailable: true)
    
    var name: String
    var gradeMustBeAvailable: Bool
}
