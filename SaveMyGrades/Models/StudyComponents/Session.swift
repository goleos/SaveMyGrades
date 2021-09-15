//
//  Session.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 04/09/2021.
//

import Foundation



class Session: Period {
    
    var periods: [Assessment] { get { _components }
        set {_components = newValue}
    }
    
    override var modules: [Assessment] { get {_components.map({
        return ($0 as! Period).modules
    }).reduce([Assessment](), +)}
    @available(*, unavailable)
    set {}
        
    }
}




//class Session: AggregationComponent {
//    var displayGradingMethod: GradingMethod
//
//    var assessmentStructure: [StudyComponent] = []
//
//    var cumulativeWeightOfComponents: Double {
//        guard !assessmentStructure.isEmpty else {
//            return 0.0
//        }
//        return assessmentStructure.map {
//            return $0.weight
//        }.reduce(0.0, +)
//    }
//
//
//    static var shared: Institution? = nil
//
//    let institutionType: InstitutionType
//    var auxiliaryGradingMethods: [GradingMethod] = []
//
//    init(type: InstitutionType, primaryGradingMethod: GradingMethod, auxiliaryGradingMethods: [GradingMethod]) {
//        self.institutionType = type
//        self.displayGradingMethod = primaryGradingMethod
//        self.auxiliaryGradingMethods = auxiliaryGradingMethods
//    }
//}
//
//enum InstitutionType {
//    case university
//    case school
//}

