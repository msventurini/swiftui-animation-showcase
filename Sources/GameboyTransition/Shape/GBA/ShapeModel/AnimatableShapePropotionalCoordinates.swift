//
//  AnimatableShapePositionCoordinates.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

struct AnimatableShapePropotionalCoordinates: Sendable, Animatable {
    
    var topLeading: CGPoint
    var topTrailing: CGPoint
    var bottomLeading: CGPoint
    var bottomTrailing: CGPoint
    
    var animatableData: AnimatablePair<
        AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData>,
        AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData>>
    {
        get {
           AnimatablePair(
            AnimatablePair(
                topLeading.animatableData,
                topTrailing.animatableData
            ),
            AnimatablePair(
                bottomLeading.animatableData,
                bottomTrailing.animatableData
            )
           )
        }

        set {
            topLeading.animatableData = newValue.first.first
            topTrailing.animatableData = newValue.first.second
            bottomLeading.animatableData = newValue.second.first
            bottomTrailing.animatableData = newValue.second.second
        }
    }
    
    static let zero: AnimatableShapePropotionalCoordinates = .init(topLeading: .zero, topTrailing: .zero, bottomLeading: .zero, bottomTrailing: .zero)
    
    
}
