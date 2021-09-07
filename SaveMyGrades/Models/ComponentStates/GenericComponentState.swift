//
//  GenericComponentState.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 06/09/2021.
//

import Foundation

struct GenericComponentState: ComponentState {
    
    static let notCompleted = GenericComponentState(name: "Not Completed", gradeMustBeAvailable: false)
    
    var name: String
    var gradeMustBeAvailable: Bool
}
