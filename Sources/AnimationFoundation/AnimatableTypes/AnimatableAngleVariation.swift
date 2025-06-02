//
//  AnimatableShapeAngleVariation.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI


public struct AnimatableAngleVariation: Sendable {
    
    public var startAngle: Angle
    public var endAngle: Angle
    
    public init(startAngle: Angle, endAngle: Angle) {
        self.startAngle = startAngle
        self.endAngle = endAngle
    }

}


extension AnimatableAngleVariation: AdditiveArithmetic {
    
    public static func normalizeAngleValue(angleValue: Double) -> Double {
        var truncatedNumber = angleValue
        truncatedNumber.formTruncatingRemainder(dividingBy: 360)

        if truncatedNumber < 0 {
            truncatedNumber += 360
        }
        
        return truncatedNumber
    }
    
    public static func add(lhs: Double, rhs: Double) -> Double {
        
        let result = normalizeAngleValue(angleValue: (rhs + lhs))
        return result
    }
    
    public static func + (lhs: AnimatableAngleVariation, rhs: AnimatableAngleVariation) -> AnimatableAngleVariation {
        return .init(
            startAngle: Angle(degrees: add(lhs: lhs.startAngle.degrees, rhs: rhs.startAngle.degrees)),
            endAngle: Angle(degrees: add(lhs: lhs.endAngle.degrees, rhs: rhs.endAngle.degrees)))
    }
    
    
    public static func - (lhs: AnimatableAngleVariation, rhs: AnimatableAngleVariation) -> AnimatableAngleVariation {
        
        return .init(
            startAngle: Angle(degrees: add(lhs: lhs.startAngle.degrees, rhs: -rhs.startAngle.degrees)),
            endAngle: Angle(degrees: add(lhs: lhs.endAngle.degrees, rhs: -rhs.endAngle.degrees)))
    }
    
    
    
    public static let zero: AnimatableAngleVariation = .init(/*radius: .zero, */startAngle: .zero, endAngle: .zero)
    
}

extension AnimatableAngleVariation: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        self.startAngle.animatableData.scale(by: rhs)
        self.endAngle.animatableData.scale(by: rhs)
    }
    
    public var magnitudeSquared: Double {
        self.startAngle.animatableData.magnitudeSquared + self.endAngle.animatableData
//        AnimatableAngleVariation.normalizeAngleValue(angleValue: self.startAngle.degrees.magnitudeSquared + self.endAngle.degrees.magnitudeSquared)
    }
    
    
}
