//
//  GradingFunctionality.swift
//  SaveMyGradesTests
//
//  Created by Leonid Goldberg on 07/09/2021.
//

@testable import SaveMyGrades
import XCTest


class GradingFunctionality: XCTestCase {
    
    var randomValidGrade: Grade {
        return try! Grade(String(Double.random(in: 0.0...100.0)), gradingMethod: .percentageGrade)
    }
    
    var UKDegreeGradingMethod: GradingMethod?
    
    func test_create_valid_percentage_grade() throws {
        let testGrade = String(Double.random(in: 0.0...100.0))
        XCTAssertNoThrow(try Grade(testGrade))
        XCTAssertNoThrow(try Grade(testGrade, gradingMethod: .percentageGrade))
    }
    
    func test_create_invalid_percentage_grade() throws {
        let expectedOver100Error = ValidationError.percentageGradeIsOver100
        let expectedNegativeError = ValidationError.percentageGradeIsNegative
        
        let over100TestGrade = String(Double.random(in: (100.0...20000.0)))
        let negativeTestGrade = String(Double.random(in: -20000.0...0.0))
        
        XCTAssertThrowsError(try Grade(over100TestGrade), "nil") { error in
            XCTAssertEqual(error as? ValidationError, expectedOver100Error)
        }
        
        XCTAssertThrowsError(try Grade(negativeTestGrade), "nil") { error in
            XCTAssertEqual(error as? ValidationError, expectedNegativeError)
        }
    
    }
    
    func test_average_method_is_working_correctly() {
        let grade1 = randomValidGrade
        let grade2 = randomValidGrade
        let grade3 = randomValidGrade
        let gradesArray = [grade1, grade2, grade3]
        let expectedAverage = (gradesArray.map{return $0.percentageGradeValue}.reduce(0, +)) / Double(gradesArray.count)
        let average = Grade.average(from: [grade1, grade2, grade3]).percentageGradeValue
        XCTAssertEqual(expectedAverage, average)
    }
    
    func test_initialise_uk_degree_grading_method_from_JSON() {
        XCTAssertNoThrow(GradingMethod(with: "UKDegreeClassification"))
        UKDegreeGradingMethod = GradingMethod(with: "UKDegreeClassification")
    }
    
    func test_uk_degree_grading_method_converter_function() throws {
        let UKDegreeGradingMethod = GradingMethod(with: "UKDegreeClassification")
        let firstClassGrade = try Grade("First Class", gradingMethod: UKDegreeGradingMethod)
        XCTAssertGreaterThanOrEqual(firstClassGrade.percentageGradeValue, 70.0, "First Class must be over 70%")
        
    }


}
