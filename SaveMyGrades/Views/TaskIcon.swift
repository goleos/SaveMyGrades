//
//  TaskIcon.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 16/09/2021.
//

import Foundation
import UIKit

struct TaskIcon: CustomStringConvertible {
    var description: String
    
    var image: UIImage { UIImage(systemName: description)! }
    
    init(for task: Task) {
        switch task {
        case is Session:
            description = TaskIcon.session
        case is Period:
            description = TaskIcon.period
        case is Module:
            description = TaskIcon.module
        case is Assessment:
            description = TaskIcon.assessment
        default:
            description = TaskIcon.task
        }
    }
    
    static var task = "checkmark.square.fill"
    static var assessment = "pencil.circle.fill"
    static var module = "book.circle.fill"
    static var period = "calendar.circle.fill"
    static var session = "graduationcap.fill"

}
