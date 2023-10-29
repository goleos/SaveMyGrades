//
//  UserConfiguration.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 15/09/2021.
//

import Foundation

class UserData {
    static var shared: UserData = sampleData
    
    var session: Session?
    
    var selectedPeriods: [Period]?
    
    var mainGradingStyle: GradingStyle = .percentage
    
    var secondaryGradingStyles: [GradingStyle] = []
    
    var gradingStyles: [GradingStyle] { secondaryGradingStyles + [mainGradingStyle]}
    
    var gradeTarget: Grade?
    
    
    init() { }
    
}
