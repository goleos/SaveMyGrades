//
//  TaskFunctionality.swift
//  SaveMyGradesTests
//
//  Created by Leonid Goldberg on 08/09/2021.
//

import XCTest
@testable import SaveMyGrades

class TaskFunctionality: XCTestCase {
    
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

    
    override func setUpWithError() throws {
        degree = Session()
        degree.name = "University Mathematics BSc 3-year degree"
        
        firstTerm = Period()
        firstTerm.name = "First Term"
        firstTerm.weight = 0.5
        secondTerm = Period()
        secondTerm.name = "Second Term"
        secondTerm.weight = 0.5
        
        try degree.periods.add(firstTerm)
        try degree.periods.add(secondTerm)
        
        math330 = Module()
        math330.name = "Math 330"
        math330.weight = 0.4
        math317 = Module()
        math317.name = "Math 317"
        math317.weight = 0.6
        math318 = Module()
        math318.name = "Math 318"
        math318.weight = 1.0
        
        try firstTerm.modules.add(math330)
        try firstTerm.modules.add(math317)
        try secondTerm.modules.add(math318)
        
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
        
        try math318.assessments.add(project318)
        try math318.assessments.add(cw1_318)
        try math317.assessments.add(exam317)
        try math330.assessments.add(project330)
        try math330.assessments.add(exam330)
        
        researchProject318 = Task()
        researchProject318.name = "Project 318"
        
        try math318.tasks.add(researchProject318)
        
    }

    func test_expected_cumulative_weights() {
        XCTAssertEqual(degree.periods.cumulativeWeight, 1.0)
        XCTAssertEqual(firstTerm.modules.cumulativeWeight, 1.0)
        XCTAssertEqual(secondTerm.modules.cumulativeWeight, 1.0)
        XCTAssertEqual(math318.assessments.cumulativeWeight, 1.0)
        XCTAssertEqual(math317.assessments.cumulativeWeight, 1.0)
        XCTAssertEqual(math330.assessments.cumulativeWeight, 1.0)
    }

    
    func test_invalid_excessive_adding() throws {
        let expectedError = ValidationError.excessiveWeightInParent
        var actualError: ValidationError?
        let dummyAssessment = Assessment()
        dummyAssessment.name = "Test"
        dummyAssessment.weight = 0.01
        XCTAssertThrowsError(try math318.assessments.add(dummyAssessment)) {
            actualError = $0 as? ValidationError
        }
//        XCTAssertEqual(actualError, expectedError)
    }
    
    
    func test_correct_assessment_array() {
        let firstTermAssessments = firstTerm.assessments.map({return $0.name})
        XCTAssertTrue(Set(firstTermAssessments) == Set([exam330, exam317, project330].map({return $0?.name})))
        XCTAssertTrue(Set(degree.modules.map({return $0.name})) == Set([math318, math317, math330].map({return $0?.name})))
    }
    
    func test_valid_grading_behaviour() throws {
        XCTAssertNil(degree.grade)
        XCTAssertEqual(degree.cumulativeGrade, Grade(percentage: 0))
        project318.grade = Grade(percentage: 70)
        XCTAssertEqual(degree.grade, Grade(percentage: 70))
        cw1_318.grade = Grade(percentage: 90)
        XCTAssertEqual(math318.grade, Grade(percentage: 76))
        XCTAssertEqual(degree.cumulativeGrade, Grade(percentage: 38))
        
    }
    
    func test_add_gradeable_to_tasks() {
        XCTAssertThrowsError(try cw1_318.tasks.add(project330))
    }

}
