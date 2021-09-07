//
//  Institution.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 04/09/2021.
//

import Foundation

class Institution: AggregationComponent {
    var displayGradingMethod: GradingMethod
    
    var assessmentStructure: [StudyComponent] = []
    
    var cumulativeWeightOfComponents: Double {
        guard !assessmentStructure.isEmpty else {
            return 0.0
        }
        return assessmentStructure.map {
            return $0.weight
        }.reduce(0.0, +)
    }
    
    
    static var shared: Institution?
    
    let institutionType: InstitutionType
    var auxiliaryGradingMethods: [GradingMethod] = []
    
    init(type: InstitutionType) {
        self.institutionType = type
    }
}

enum InstitutionType {
    case university
    case school
}

