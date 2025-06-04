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
    public var delta: Angle
    
    public var isDeltaNegative: Bool {
        return (delta.degrees < 0) ? true : false
    }
    
    public init(startAngle: Angle = .zero, endAngle: Angle = .zero) {
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.delta = endAngle - startAngle
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
            delta.animatableData = newValue.second - newValue.first
        }
    }
    
//    static let zero: AnimatableAngleVariation = .init(startAngle: .zero, endAngle: .zero)
}
