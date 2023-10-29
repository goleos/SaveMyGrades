//
//  Task.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation

class Task {
    static var statusList: [TaskStatus] {
        return TaskStatus.allCases.filter {
            return $0.type == Self.self
        }}
    
    var name: String?
    var status: TaskStatus
    
    var deadline: Date?
    var description: String?

    init() {
        status = TaskStatus.allCases.filter({return $0.type == Self.self})[0]
    }
    
    init(name: String, status: TaskStatus) {
        self.name = name
        self.status = status
    }
}

extension Array where Element == Task {
    
    mutating func add(_ task: Task) throws {
        guard task.status.type == Task.self else { throw ValidationError.addingIncorrectType }
        guard let name = task.name else { throw ValidationError.valueNotProvided("Name") }
        guard !self.map({return $0.name}).contains(name) else { throw ValidationError.duplicateName }
        
        self.append(task)
}
}
