//
//  SaveMyGradesTests.swift
//  SaveMyGradesTests
//
//  Created by Leonid Goldberg on 07/09/2021.
//

import XCTest
@testable import SaveMyGrades

class SaveMyGradesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func testSccenario1() throws {
//        let degree = Session(type: .university, primaryGradingMethod: .percentageGrade, auxiliaryGradingMethods: [])
//        let math336 = try Module(name: "MATH336", parentComponent: degree, weight: 1.0)
//        
//
//        let cw1 = try Assessment(name: "CW1", parentComponent: math336, weight: 0.05)
//        let cw2 = try Assessment(name: "CW2", parentComponent: math336, weight: 0.05)
//        let math336Exam = try Exam(name: "Exam", parentComponent: math336, weight: 0.7)
//        let math336Project = try Assessment(name: "Project", parentComponent: math336, weight: 0.2)
//        
//        cw1.grade = try Grade("80")
//        cw2.grade = try Grade("70")
//        math336Project.grade = try Grade("75")
//        math336Exam.componentState = .submitted
//        
//        let averageFromModule = math336.averageToDate
//        XCTAssertEqual(averageFromModule?.percentageGradeValue, (22.5 / 30.0)*100.0)
//        
//        XCTAssertThrowsError(try Assessment(name: "CW3", parentComponent: math336, weight: 0.2))
//    }
    


}
