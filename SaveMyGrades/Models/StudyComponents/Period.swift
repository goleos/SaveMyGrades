//
//  Session.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation

class Period: Module {
    
    func add(module: Module) throws {
        try add(assessment: module)
    }
    
}
