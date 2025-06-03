//
//  AnimatableShapeAngleValues.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

public struct AnimatableShapeAngleValues: Sendable, Animatable {
    
    var topLeadingAngleValues: AnimatableAngleVariation
    var topTrailingAngleValues: AnimatableAngleVariation
    var bottomTrailingAngleValues: AnimatableAngleVariation
    var bottomLeadingAngleValues: AnimatableAngleVariation
    
    public var animatableData: AnimatablePair<
        AnimatablePair<
            AnimatableAngleVariation.AnimatableData,
            AnimatableAngleVariation.AnimatableData
        >,
        AnimatablePair<
            AnimatableAngleVariation.AnimatableData,
            AnimatableAngleVariation.AnimatableData>
    >
    {
        get {
           AnimatablePair(
            AnimatablePair(
                topLeadingAngleValues.animatableData,
                topTrailingAngleValues.animatableData
            ),
            AnimatablePair(
                bottomTrailingAngleValues.animatableData,
                bottomLeadingAngleValues.animatableData
            )
           )
        }

        set {
            topLeadingAngleValues.animatableData = newValue.first.first
            topTrailingAngleValues.animatableData = newValue.first.second
            bottomTrailingAngleValues.animatableData = newValue.second.first
            bottomLeadingAngleValues.animatableData = newValue.second.second
        }
    }
    
    static let zero = AnimatableShapeAngleValues(topLeadingAngleValues: .zero, topTrailingAngleValues: .zero, bottomTrailingAngleValues: .zero, bottomLeadingAngleValues: .zero)
    
    public init(topLeadingAngleValues: AnimatableAngleVariation, topTrailingAngleValues: AnimatableAngleVariation, bottomTrailingAngleValues: AnimatableAngleVariation, bottomLeadingAngleValues: AnimatableAngleVariation) {
        self.topLeadingAngleValues = topLeadingAngleValues
        self.topTrailingAngleValues = topTrailingAngleValues
        self.bottomTrailingAngleValues = bottomTrailingAngleValues
        self.bottomLeadingAngleValues = bottomLeadingAngleValues
    }
    
    
    
}

//extension AnimatableShapeAngleValues: AdditiveArithmetic {
//    
//    public static func - (lhs: AnimatableShapeAngleValues, rhs: AnimatableShapeAngleValues) -> AnimatableShapeAngleValues {
//        return .init(
//            topLeadingAngleValues: lhs.topLeadingAngleValues - rhs.topLeadingAngleValues,
//            topTrailingAngleValues: lhs.topTrailingAngleValues - rhs.topTrailingAngleValues,
//            bottomTrailingAngleValues: lhs.bottomTrailingAngleValues - rhs.bottomTrailingAngleValues,
//            bottomLeadingAngleValues: lhs.bottomLeadingAngleValues - rhs.bottomLeadingAngleValues)
//    }
//    
//    public static func + (lhs: AnimatableShapeAngleValues, rhs: AnimatableShapeAngleValues) -> AnimatableShapeAngleValues {
//        return .init(
//            topLeadingAngleValues: lhs.topLeadingAngleValues + rhs.topLeadingAngleValues,
//            topTrailingAngleValues: lhs.topTrailingAngleValues + rhs.topTrailingAngleValues,
//            bottomTrailingAngleValues: lhs.bottomTrailingAngleValues + rhs.bottomTrailingAngleValues,
//            bottomLeadingAngleValues: lhs.bottomLeadingAngleValues + rhs.bottomLeadingAngleValues)
//    }
//    
//    public static let zero: AnimatableShapeAngleValues = .init(topLeadingAngleValues: .zero, topTrailingAngleValues: .zero, bottomTrailingAngleValues: .zero, bottomLeadingAngleValues: .zero)
//}
//
//extension AnimatableShapeAngleValues: VectorArithmetic {
//    public mutating func scale(by rhs: Double) {
//        self.topLeadingAngleValues.scale(by: rhs)
//        self.topTrailingAngleValues.scale(by: rhs)
//        self.bottomTrailingAngleValues.scale(by: rhs)
//        self.bottomLeadingAngleValues.scale(by: rhs)
//        
//    }
//    
//    public var magnitudeSquared: Double {
//        
//        return (topLeadingAngleValues.magnitudeSquared + topTrailingAngleValues.magnitudeSquared + bottomTrailingAngleValues.magnitudeSquared + bottomLeadingAngleValues.magnitudeSquared)
//
//        
//    }
//    
//    
//}
