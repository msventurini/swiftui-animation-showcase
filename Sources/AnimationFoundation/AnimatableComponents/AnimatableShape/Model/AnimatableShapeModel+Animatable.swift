//
//  AnimatableShapeModel+Animatable.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

extension AnimatableShapeModel: Animatable {
    
    public var animatableData: AnimatablePair<
        AnimatablePair<
            AnimatableShapePropotionalCoordinates.AnimatableData,
            RectangleCornerRadii.AnimatableData
        >,
        AnimatableShapeAngleValues.AnimatableData
    >
    {
        get {
            AnimatablePair(
                AnimatablePair(
                    coordinates.animatableData,
                    cornerRadii.animatableData
                ),
                angleValues.animatableData
            )
        }
        
        set {
            coordinates.animatableData = newValue.first.first
            cornerRadii.animatableData = newValue.first.second
            angleValues.animatableData = newValue.second
        }
    }
}

#Preview {
    TesteMorphingShape()
}
