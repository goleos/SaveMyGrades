//
//  Grade.swift
//  SaveMyGrades
//
//  Created by Leonid Goldberg on 02/09/2021.
//

import Foundation

struct Grade {
    let percentage: Double
    var style: GradingStyle
    var value: String {
        guard style == .percentage else {
            let roundedPercentage = Double(round(10*self.percentage)/10)
            return "\(roundedPercentage) %"
        }
        for stringValue in style.data.thresholds.keys {
            if Grade.percentageRange(of: stringValue, with: style).contains(percentage) {
                return stringValue
            }
    }
        return "ERROR"
    }
    
    init(percentage: Double, style: GradingStyle = .percentage) {
        self.percentage = percentage
        self.style = style
    }
    
    init(value: String, style: GradingStyle) {
        let range = Grade.percentageRange(of: value, with: style)
        self.percentage = (range.lowerBound + range.upperBound) / 2.0
        self.style = style
    }
    
    static func percentageRange(of value: String, with style: GradingStyle) -> Range<Double> {
        let thresholds = style.data.thresholds
        let lowerBound = thresholds[value]!
        let upperBound = thresholds.values.filter({ $0 > lowerBound }).min() ?? 100.0
        return lowerBound..<upperBound
    }
    
    func value(as style: GradingStyle) -> String {
        var returnGrade = self
        returnGrade.style = style
        return returnGrade.value
    }
}

extension Grade: Equatable {
    static func == (lhs: Grade, rhs: Grade) -> Bool {
        return lhs.percentage == rhs.percentage
    }
}

extension Grade: Comparable {
    static func < (lhs: Grade, rhs: Grade) -> Bool {
        return lhs.percentage < rhs.percentage
    }
    
    static func > (lhs: Grade, rhs: Grade) -> Bool {
        return lhs.percentage > rhs.percentage
    }
    
    static func <= (lhs: Grade, rhs: Grade) -> Bool {
        return lhs.percentage <= rhs.percentage
    }
    
    static func >= (lhs: Grade, rhs: Grade) -> Bool {
        return lhs.percentage >= rhs.percentage
    }
}


extension Array where Element == Grade {
    func average(as style: GradingStyle = .percentage) -> Grade {
        let percentages = self.map({ return $0.percentage })
        let percentage = percentages.reduce(0, +) / Double(percentages.count)
        return Grade(percentage: percentage, style: style)
    }
}

