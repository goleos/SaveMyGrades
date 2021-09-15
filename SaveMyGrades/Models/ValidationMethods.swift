//
//  ValidationMethods.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 07/09/2021.
//

import Foundation

//extension Assessment {
//    func add(task: Task) throws {
//        guard (tasks + [task]).allSatisfy({ $0.status.type == Task.self }) else {
//            throw ValidationError.addingIncorrectType
//        }
//        guard let name = task.name else { throw ValidationError.valueNotProvided("Name") }
//        guard !tasks.map({return $0.name}).contains(name) else { throw ValidationError.duplicateName }
//}
//}
//
//extension Module {
//    func add(assessment: Assessment) throws {
//        guard (_components + [assessment]).allSatisfy({ $0.status.type == assessment.status.type }) else {
//            throw ValidationError.addingIncorrectType
//        }
//        guard let name = assessment.name else { throw ValidationError.valueNotProvided("Name") }
//        guard !_components.map( {return $0.name} ).contains(name) else { throw ValidationError.duplicateName }
//        guard (0.0...100.0).contains(assessment.weight) else { throw ValidationError.invalidWeight}
//        guard cumulativeWeightOfAllComponents + assessment.weight <= 100.0 else { throw ValidationError.excessiveWeightInParent}
//        _components.append(assessment)
//    }
//}










//struct ValidationMethods {
//
//    static func weightIsBetween0And1(_ weight: Double) throws {
//        guard weight >= 0.0 else {
//            throw ValidationError.weightIsNegative
//        }
//        guard weight <= 100 else {
//            throw ValidationError.weightIsOver1
//        }
//    }
//
//    static func weightIsNotExcessive(_ weight: Double, in component: Aggregable) throws {
//        guard (component.cumulativeWeightOfAllComponents + weight) <= 1.0 else {
//            throw ValidationError.excessiveWeightInParent
//        }
//    }
//
//    static func stringIsANumber(_ string: String) throws -> Double {
//        guard let percentage = Double(string) else {
//            throw ValidationError.stringIsNotANumber
//        }
//        return percentage
//    }
//
//    static func validPercentageGradeStringValue(_ value: String) throws {
//        let doubleValue = try stringIsANumber(value)
//        guard doubleValue >= 0.0 else {
//            throw ValidationError.percentageGradeIsNegative
//        }
//        guard doubleValue <= 100 else {
//            throw ValidationError.percentageGradeIsOver100
//        }
//    }
//
//    static func noDuplicateNameInTasks(_ name: String, _ tasks: [Task]) throws {
//        let componentNames = tasks.map {
//            return $0.name
//        }
//        guard !(componentNames.contains(name)) else {
//            throw ValidationError.duplicateName
//        }
//    }
//
//    static func taskStatusIsValid(_ target: TaskStatus, from array: [TaskStatus]) throws {
//        print(target)
//        print(array)
//        guard array.contains(target) else {
//            throw ValidationError.invalidStatus
//        }
//    }
//}


enum ValidationError: Error {
    case valueNotProvided(_ value: String)
    case noCommonType
    case addingIncorrectType
    case invalidWeight
    case nameIsNotProvided
    case statusIsNotProvided
    case weightIsNotProvided
    case weightIsNegative
    case weightIsOver1
    case stringIsNotANumber
    case percentageGradeIsNegative
    case percentageGradeIsOver100
    case excessiveWeightInParent
    case duplicateName
    case invalidStatus
    case taskIsRemoved
}


