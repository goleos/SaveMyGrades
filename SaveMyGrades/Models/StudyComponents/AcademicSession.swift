//
//  AcademicSession.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 06/09/2021.
//

import Foundation

class AcademicSession: Module {
    
    override var averageToDate: Grade? {
        let existingGrades = assessmentStructure.filter { module in
            if (module as! Module).averageToDate != nil {
                return true
            } else {
                return false
            }
        }
        return Grade.average(from: existingGrades.map({
            return ($0 as! Module).averageToDate!
        }), showAs: displayGradingMethod)
    }
    
}
