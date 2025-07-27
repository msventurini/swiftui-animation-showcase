//
//  AnimatableShapeAngleValues.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

public struct AnimatableShapeAngleValues: Sendable, Animatable {
    
    var topLeading: AnimatableAngleVariation
    var topTrailing: AnimatableAngleVariation
    var bottomTrailing: AnimatableAngleVariation
    var bottomLeading: AnimatableAngleVariation
    
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
                topLeading.animatableData,
                topTrailing.animatableData
            ),
            AnimatablePair(
                bottomTrailing.animatableData,
                bottomLeading.animatableData
            )
           )
        }

        set {
            topLeading.animatableData = newValue.first.first
            topTrailing.animatableData = newValue.first.second
            bottomTrailing.animatableData = newValue.second.first
            bottomLeading.animatableData = newValue.second.second
        }
    }
    
    static let zero = AnimatableShapeAngleValues(topLeading: .init(), topTrailing: .init(), bottomTrailing: .init(), bottomLeading: .init())
    
    public init(
        topLeading: AnimatableAngleVariation = .init(),
        topTrailing: AnimatableAngleVariation = .init(),
        bottomTrailing: AnimatableAngleVariation = .init(),
        bottomLeading: AnimatableAngleVariation = .init()) {
        self.topLeading = topLeading
        self.topTrailing = topTrailing
        self.bottomTrailing = bottomTrailing
        self.bottomLeading = bottomLeading
    }
    
    
    
}

extension AnimatableShapeAngleValues: Equatable {
    
}

extension AnimatableShapeAngleValues: Hashable {
    
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
