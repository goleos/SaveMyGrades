//
//  ModuleComponentState.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 06/09/2021.
//

import Foundation

struct ModuleComponentState: ComponentState {
    static let notCompleted = ModuleComponentState(name: "Not Completed", gradeMustBeAvailable: false)
    static let completed = ModuleComponentState(name: "Completed", gradeMustBeAvailable: false)
    static let graded = ModuleComponentState(name: "Graded", gradeMustBeAvailable: true)
    
    var name: String
    var gradeMustBeAvailable: Bool
    
}
