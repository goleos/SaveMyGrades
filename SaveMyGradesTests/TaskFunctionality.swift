//
//  TaskFunctionality.swift
//  SaveMyGradesTests
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import XCTest
@testable import SaveMyGrades

class TaskFunctionality: XCTestCase {
    
//    var degree: Session!
//    var firstTerm: Period!
//    var secondTerm: Period!
//    var math330: Module!
//    var math317: Module!
//    var math318: Module!
//    var project318: Assessment!
//    var cw1_318: Assessment!
//    var exam317: Assessment!
//    var exam330: Assessment!
//    var project330: Assessment!
//    var researchProject318: Task!
//
//    
//    override func setUpWithError() throws {
//        degree = Session()
//        degree.name = "University Mathematics BSc 3-year degree"
//        
//        firstTerm = Period()
//        firstTerm.name = "First Term"
//        firstTerm.weight = 0.5
//        secondTerm = Period()
//        secondTerm.name = "Second Term"
//        secondTerm.weight = 0.5
//        
//        try degree.add(period: firstTerm)
//        try degree.add(period: secondTerm)
//        
//        math330 = Module()
//        math330.name = "Math 330"
//        math330.weight = 0.4
//        math317 = Module()
//        math317.name = "Math 317"
//        math317.weight = 0.6
//        math318 = Module()
//        math318.name = "Math 318"
//        math318.weight = 1.0
//        
//        try firstTerm.add(module: math330)
//        try firstTerm.add(module: math317)
//        try secondTerm.add(module: math318)
//        
//        project318 = Assessment()
//        project318.name = "Project 318"
//        project318.weight = 0.7
//        cw1_318 = Assessment()
//        cw1_318.name = "CW1 318"
//        cw1_318.weight = 0.3
//        exam317 = Assessment()
//        exam317.name = "Exam 317"
//        exam317.weight = 1.0
//        exam330 = Assessment()
//        exam330.name = "Exam 330"
//        exam330.weight = 0.6
//        project330 = Assessment()
//        project330.name = "Project 330"
//        project330.weight = 0.4
//        
//        try math318.add(assessment: project318)
//        try math318.add(assessment: cw1_318)
//        try math317.add(assessment: exam317)
//        try math330.add(assessment: project330)
//        try math330.add(assessment: exam330)
//        
//        researchProject318 = Task()
//        researchProject318.name = "Project 318"
//        
//        try math318.add(task: researchProject318)
//        
//    }
//
//    func test_expected_cumulative_weights() {
//        XCTAssertEqual(degree.cumulativeWeightOfAllComponents, 1.0)
//        XCTAssertEqual(firstTerm.cumulativeWeightOfAllComponents, 1.0)
//        XCTAssertEqual(secondTerm.cumulativeWeightOfAllComponents, 1.0)
//        XCTAssertEqual(math318.cumulativeWeightOfAllComponents, 1.0)
//        XCTAssertEqual(math317.cumulativeWeightOfAllComponents, 1.0)
//        XCTAssertEqual(math330.cumulativeWeightOfAllComponents, 1.0)
//    }
//
//    
//    func test_invalid_excessive_adding() throws {
//        let expectedError = ValidationError.excessiveWeightInParent
//        var actualError: ValidationError?
//        let dummyAssessment = Assessment()
//        dummyAssessment.name = "Test"
//        dummyAssessment.weight = 0.01
//        XCTAssertThrowsError(try math318.add(assessment: dummyAssessment)) {
//            actualError = $0 as? ValidationError
//        }
//        XCTAssertEqual(actualError, expectedError)
//    }
//    
//    func test_valid_grading_behaviour() throws {
//        XCTAssertNil(degree.grade)
//        try project318.grade = Grade("70")
//        XCTAssertNotNil(degree.grade)
//    }
//    
//    
//    func test_add_gradeable_to_tasks() {
//        XCTAssertThrowsError(cw1_318.add(task: project330))
//    }

}
