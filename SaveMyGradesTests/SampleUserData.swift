//
//  SampleUserData.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 17/09/2021.
//

import Foundation

var sampleData: UserData {
    
    var data = UserData()
    data.gradeTarget = Grade(percentage: 70)

    var degree: Session!
    var firstTerm: Period!
    var secondTerm: Period!
    var math330: Module!
    var math317: Module!
    var math318: Module!
    var project318: Assessment!
    var cw1_318: Assessment!
    var exam317: Assessment!
    var exam330: Assessment!
    var project330: Assessment!
    var researchProject318: Task!
    degree = Session()
    degree.name = "University Mathematics BSc 3-year degree"

    firstTerm = Period()
    firstTerm.name = "First Term"
    firstTerm.weight = 0.5
    secondTerm = Period()
    secondTerm.name = "Second Term"
    secondTerm.weight = 0.5

    try! degree.periods.add(firstTerm)
    try! degree.periods.add(secondTerm)

    math330 = Module()
    math330.name = "Math 330"
    math330.weight = 0.4
    math317 = Module()
    math317.name = "Math 317"
    math317.weight = 0.6
    math318 = Module()
    math318.name = "Math 318"
    math318.weight = 1.0

    try! firstTerm.modules.add(math330)
    try! firstTerm.modules.add(math317)
    try! secondTerm.modules.add(math318)

    project318 = Assessment()
    project318.name = "Project 318"
    project318.weight = 0.7
    cw1_318 = Assessment()
    cw1_318.name = "CW1 318"
    cw1_318.weight = 0.3
    exam317 = Assessment()
    exam317.name = "Exam 317"
    exam317.weight = 1.0
    exam330 = Assessment()
    exam330.name = "Exam 330"
    exam330.weight = 0.6
    project330 = Assessment()
    project330.name = "Project 330"
    project330.weight = 0.4

    try! math318.assessments.add(project318)
    try! math318.assessments.add(cw1_318)
    try! math317.assessments.add(exam317)
    try! math330.assessments.add(project330)
    try! math330.assessments.add(exam330)

    exam330.grade = Grade(percentage: 70.9)
    
    researchProject318 = Task()
    researchProject318.name = "Project 318"

    try! math318.tasks.add(researchProject318)
    

    data.session = degree
    return data
}
