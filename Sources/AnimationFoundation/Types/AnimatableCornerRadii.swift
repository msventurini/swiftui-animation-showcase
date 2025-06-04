//
//  AnimatableCornerRadii.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//


import SwiftUI

public struct AnimatableCornerRadii: Sendable, Animatable, Hashable {
    
    var topLeading: Double
    var bottomLeading: Double
    var bottomTrailing: Double
    var topTrailing: Double
    
    
    public var animatableData: AnimatablePair<
        AnimatablePair<Double, Double>,
        AnimatablePair<Double, Double>
    >
    {
        get {
           AnimatablePair(
            AnimatablePair(
                topLeading,
                topTrailing
            ),
            AnimatablePair(
                bottomLeading,
                bottomTrailing
            )
           )
        }

        set {
            topLeading = newValue.first.first
            topTrailing = newValue.first.second
            bottomLeading = newValue.second.first
            bottomTrailing = newValue.second.second
        }
    }
    
    public init(
        topLeading: Double = 0,
        bottomLeading: Double = 0,
        bottomTrailing: Double = 0,
        topTrailing: Double = 0
    ) {
        self.topLeading = topLeading
        self.bottomLeading = bottomLeading
        self.bottomTrailing = bottomTrailing
        self.topTrailing = topTrailing
    }
    
}