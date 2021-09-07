//
//  Component.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 06/09/2021.
//

import Foundation

class StudyComponent {
    private(set) var parentComponent: AggregationComponent
    
    private(set) var name: String
    
    private(set) var weight: Double
    
    private(set) var isValid: Bool = false
    
    var indexInParentAssessmentStructure: Int? {
        let assessmentNames = parentComponent.assessmentStructure.map {
            return $0.name
        }
        return assessmentNames.lastIndex(of: self.name)
    }
    
    private(set) var isRemoved: Bool = false
            
    init(name: String, parentComponent: AggregationComponent, weight: Double) throws {
        self.name = name
        self.parentComponent = parentComponent
        self.weight = weight
        try self.validate(addToParent: true)
    }
    
    func validate(addToParent: Bool = false) throws {
        self.isValid = false
        guard !isRemoved else {
            throw NSError()
        }
        guard (0.0...100.0).contains(self.weight) else {
            throw ComponentError.invalidWeight
        }
        guard (parentComponent.cumulativeWeightOfComponents + self.weight) <= 100 else {
            throw ComponentError.weightDoesNotFit
        }
        let componentNames = parentComponent.assessmentStructure.map {
            return $0.name
        }
        guard !(componentNames.contains(self.name)) else {
            throw ComponentError.duplicateNameRefusal
        }
        self.isValid = true
        if addToParent {
            parentComponent.assessmentStructure.append(self)
        } else {
            parentComponent.assessmentStructure[indexInParentAssessmentStructure!] = self
        }
    }
    
    func changeName(to: String) throws {
        self.name = to
        try validate()
    }
    
    func changeWeight(to: Double) throws {
        self.weight = to
        try validate()
    }
    
    func removeFromParent() {
        parentComponent.assessmentStructure.remove(at: indexInParentAssessmentStructure!)
        isRemoved = true
    }
}
