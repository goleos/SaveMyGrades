//
//  TaskStatus.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation

enum TaskStatus: String, CaseIterable {
    case taskNotCompleted = "Task: Not Completed"
    case taskCompleted = "Task: Completed"
    case assessmentDue = "Assessment: Due"
    case assessmentInProgress = "Assessment: In Progress"
    case assessmentReadyToSubmit = "Assessment: Ready To Submit"
    case assessmentSubmitted = "Assessment: Submitted"
    case moduleNotStarted = "Module: Not Started"
    case moduleInProgress = "Module: In Progress"
    case moduleFinished = "Module: Finished"
    case periodNotStarted = "Period: Not Started"
    case periodInProgress = "Period: In Progress"
    case periodVacation = "Period: Paused for vacation"
    case periodFinished = "Period: Finished"
    case sessionInProgress = "Session: In Progress"
    case sessionFinished = "Session: Completed"
    
    var displayTitle: String {
        return self.rawValue.components(separatedBy: ": ")[1]
    }
    
    var completed: Bool {
        switch self {
        case .taskCompleted: return true
        case .taskNotCompleted: return false
        case .assessmentDue: return false
        case .assessmentInProgress: return false
        case .assessmentReadyToSubmit: return false
        case .assessmentSubmitted: return true
        case .moduleNotStarted: return false
        case .moduleInProgress: return false
        case .moduleFinished: return true
        case .periodNotStarted: return false
        case .periodInProgress: return false
        case .periodVacation: return false
        case .periodFinished: return true
        case .sessionInProgress: return false
        case .sessionFinished: return true
        }
    }
    
    var type: Task.Type {
        switch self {
        case .taskCompleted, .taskNotCompleted:
            return Task.self
        case .assessmentDue, .assessmentInProgress, .assessmentReadyToSubmit, .assessmentSubmitted:
            return Assessment.self
        case .moduleNotStarted, .moduleInProgress, .moduleFinished:
            return Module.self
        case .periodNotStarted, .periodInProgress, .periodVacation, .periodFinished:
            return Period.self
        case .sessionInProgress, .sessionFinished:
            return Session.self
        }
        
    }
}
