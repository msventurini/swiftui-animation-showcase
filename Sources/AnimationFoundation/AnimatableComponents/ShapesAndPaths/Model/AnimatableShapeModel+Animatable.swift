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
            AnimatableCornerRadii.AnimatableData
        >,
        AnimatablePair<
            AnimatableShapeAngleValues.AnimatableData,
            AnimatableShapeGeometryValues.AnimatableData
        >
    >
    {
        get {
            AnimatablePair(
                AnimatablePair(
                    coordinates.animatableData,
                    cornerRadii.animatableData
                ),
                AnimatablePair(
                    angleValues.animatableData,
                    geometryValues.animatableData
                )
            )
        }
        
        set {
            coordinates.animatableData = newValue.first.first
            cornerRadii.animatableData = newValue.first.second
            angleValues.animatableData = newValue.second.first
            geometryValues.animatableData = newValue.second.second
        }
    }
}
//
//#Preview {
//    TesteMorphingShape()
//}
