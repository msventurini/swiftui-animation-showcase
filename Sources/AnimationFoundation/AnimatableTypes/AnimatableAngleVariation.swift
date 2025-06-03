//
//  AnimatableShapeAngleVariation.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI


public struct AnimatableAngleVariation: Sendable, Animatable {
    
    public var startAngle: Angle
    public var endAngle: Angle
    
    public init(startAngle: Angle, endAngle: Angle) {
        self.startAngle = startAngle
        self.endAngle = endAngle
    }
    
    public var animatableData: AnimatablePair<
        Angle.AnimatableData,
        Angle.AnimatableData
    >
    {
        get {
           AnimatablePair(
            startAngle.animatableData,
            endAngle.animatableData
           )
        }

        set {
            startAngle.animatableData = newValue.first
            endAngle.animatableData = newValue.second
        }
    }
    
    public static let zero: AnimatableAngleVariation = .init(startAngle: .zero, endAngle: .zero)
}
