//
//  GradingStyleTest.swift
//  SaveMyGradesTests
//
//  Created by Leonid Goldberg on 11/09/2021.
//

import XCTest
@testable import SaveMyGrades

class GradingStyleTest: XCTestCase {
    
    var stylesToTest: [GradingStyle]!
    
    override func setUp() {
        self.stylesToTest = GradingStyle.allCases
    }

    func test_all_styles_exist() {
        for style in stylesToTest {
            let name = style.data.name
            XCTAssertNotNil(name)
            XCTAssertNotNil(style.data.countries)
            XCTAssertNotNil(style.data.thresholds)
        }
    }
    
    func test_all_styles_are_valid() {
        for style in stylesToTest {
            if style != GradingStyle.percentage {
                let thresholdValues = style.data.thresholds.values.sorted()
                XCTAssertTrue(thresholdValues.contains(0.0))
                XCTAssertFalse(thresholdValues.contains(100.0))
                XCTAssertTrue(thresholdValues.allSatisfy({$0.isLess(than: 100.0)}))
                XCTAssertTrue(thresholdValues.count == Set(thresholdValues).count)
            }
            
        }
    }

}
