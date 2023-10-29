//
//  Session.swift
//  Study Planner
//
//  Created by Leonid Goldberg on 04/09/2021.
//

import Foundation

class Session: Period {
    
    var periods: [Assessment] { get { _components }
        set {_components = newValue}
    }
    
    override var modules: [Assessment] { get {_components.map({
        return ($0 as! Period).modules
    }).reduce([Assessment](), +)}
    @available(*, unavailable)
    set {}
    }
}
