//
//  Task.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation


typealias Aggregable = Module
typealias Gradeable = Assessment

class Task {
    
    var name: String?
    var statusList: [TaskStatus] {
        return TaskStatus.allCases.filter {
            return $0.type == Self.self
        }
    }
    var status: TaskStatus?
    
    var completionDate: Date?
    var description: String?

    init() {}
    
    func validate(task: Task) throws {
        try validate()
        guard (self as? Assessment) != nil else {
            return
        }
        try validateTask(task)
        guard (self as? Module) != nil else {
            return
        }
        if task.statusList[0].component == "Task" {
            return
        }
        try validateAssessment(task)
        guard (self as? Period) != nil else {
            return
        }
        print("WEnt through then")
        try validateModule(task)
        guard (self as? Session) != nil else {
            return
        }
        try validatePeriod(task)
}
    
    private func validate() throws {
        if self.status == nil {
            self.status = self.statusList[0]
        }
        guard self.name != nil else {
            throw ValidationError.nameIsNotProvided
        }
        try ValidationMethods.taskStatusIsValid(self.status!, from: self.statusList)
    }
    
    private func validateTask(_ task: Task) throws {
        let downcastedSelf = self as! Assessment
        try ValidationMethods.noDuplicateNameInTasks(task.name!, downcastedSelf.tasks)
    }
    
    private func validateAssessment(_ assessment: Task) throws {
        let downcastedSelf = self as! Module
        let assessment = assessment as! Assessment
        try ValidationMethods.noDuplicateNameInTasks(assessment.name!, downcastedSelf.gradeableComponents)
        guard let targetWeight = assessment.weight else { throw ValidationError.weightIsNotProvided }
        try ValidationMethods.weightIsBetween0And1(targetWeight)
        try ValidationMethods.weightIsNotExcessive(targetWeight, in: downcastedSelf)
    }
    
    private func validateModule(_ module: Task) throws {
        let downcastedSelf = self as! Period
        let module = module as! Module
    }
    
    private func validatePeriod(_ period: Task) throws {
        let downcastedSelf = self as! Session
        let period = period as! Period
    }
    
}
