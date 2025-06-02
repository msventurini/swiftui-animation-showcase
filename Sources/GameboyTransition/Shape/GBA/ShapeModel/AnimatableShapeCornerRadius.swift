//
//  AnimatableShapeCornerRadius.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

public struct AnimatableShapeCornerRadius: Sendable {
    
    public var topLeadingAngleRadius: Double
    public var topTrailingAngleRadius: Double
    public var bottomTrailingAngleRadius: Double
    public var bottomLeadingAngleRadius: Double
    
    public init(topLeadingAngleRadius: Double, topTrailingAngleRadius: Double, bottomTrailingAngleRadius: Double, bottomLeadingAngleRadius: Double) {
        self.topLeadingAngleRadius = topLeadingAngleRadius
        self.topTrailingAngleRadius = topTrailingAngleRadius
        self.bottomTrailingAngleRadius = bottomTrailingAngleRadius
        self.bottomLeadingAngleRadius = bottomLeadingAngleRadius
    }
    
}

extension AnimatableShapeCornerRadius: AdditiveArithmetic {
    public static func - (lhs: AnimatableShapeCornerRadius, rhs: AnimatableShapeCornerRadius) -> AnimatableShapeCornerRadius {
        return .init(
            topLeadingAngleRadius: lhs.topLeadingAngleRadius + rhs.topLeadingAngleRadius,
            topTrailingAngleRadius: lhs.topTrailingAngleRadius + rhs.topTrailingAngleRadius,
            bottomTrailingAngleRadius: lhs.bottomTrailingAngleRadius + rhs.bottomTrailingAngleRadius,
            bottomLeadingAngleRadius: lhs.bottomLeadingAngleRadius + rhs.bottomLeadingAngleRadius)
    }
    
    public static func + (lhs: AnimatableShapeCornerRadius, rhs: AnimatableShapeCornerRadius) -> AnimatableShapeCornerRadius {
        return .init(
            topLeadingAngleRadius: lhs.topLeadingAngleRadius + rhs.topLeadingAngleRadius,
            topTrailingAngleRadius: lhs.topTrailingAngleRadius + rhs.topTrailingAngleRadius,
            bottomTrailingAngleRadius: lhs.bottomTrailingAngleRadius + rhs.bottomTrailingAngleRadius,
            bottomLeadingAngleRadius: lhs.bottomLeadingAngleRadius + rhs.bottomLeadingAngleRadius)
    }
    
    public static let zero: AnimatableShapeCornerRadius = .init(topLeadingAngleRadius: .zero, topTrailingAngleRadius: .zero, bottomTrailingAngleRadius: .zero, bottomLeadingAngleRadius: .zero)
    
    
}

extension AnimatableShapeCornerRadius: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        
        self.topLeadingAngleRadius = self.topLeadingAngleRadius.scaled(by: rhs)
        self.topTrailingAngleRadius = self.topTrailingAngleRadius.scaled(by: rhs)
        self.bottomTrailingAngleRadius = self.bottomTrailingAngleRadius.scaled(by: rhs)
        self.bottomLeadingAngleRadius = self.bottomLeadingAngleRadius.scaled(by: rhs)
        
    }
    
    public var magnitudeSquared: Double {
        return (
            self.topLeadingAngleRadius.magnitudeSquared +
            self.topTrailingAngleRadius.magnitudeSquared +
            self.bottomTrailingAngleRadius.magnitudeSquared +
            self.bottomLeadingAngleRadius.magnitudeSquared
        )
    }
    
    
}
