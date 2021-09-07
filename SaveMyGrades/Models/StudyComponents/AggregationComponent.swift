//
//  AggregationComponent.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 06/09/2021.
//

import Foundation

protocol AggregationComponent {
    var displayGradingMethod: GradingMethod {get set}
    var assessmentStructure: [StudyComponent] {get set}
    var cumulativeWeightOfComponents: Double {get}
}
