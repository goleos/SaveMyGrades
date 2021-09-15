//
//  Session.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import Foundation

class Period: Module {
    
    override var assessments: [Assessment] { get {_components.map({
        return ($0 as! Module).assessments
    }).reduce([Assessment](), +)}
    @available(*, unavailable)
    set {}
    }
    
    var modules: [Assessment] { get { _components }
        set {_components = newValue}
    }
    
}
