//
//  GradingMethod.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 11/09/2021.
//

import Foundation

enum GradingStyle: String, CaseIterable {
    case percentage = "percentageGrade"
    case UKAlevel = "UKAlevel"
    case UKDegreeClassification = "UKDegreeClassification"
    case RussiaFivePointsSystem = "RussiaFivePointsSystem"
    
    struct GradingMethodJSON: Codable {
        let name: String
        let countries: [String]
        let thresholds: [String: Double]
    }
    
    var data: GradingMethodJSON {
        switch self {
        case .percentage:
            return GradingMethodJSON(name: "Percentage", countries: ["Worldwide"], thresholds: [:])
        default:
            let targetFileURL = Bundle.main.url(forResource: self.rawValue, withExtension: "json")!
                let data = try! Data(contentsOf: targetFileURL)
                let decoder = JSONDecoder()
                return try! decoder.decode(GradingMethodJSON.self, from: data)
        }
    }
}
