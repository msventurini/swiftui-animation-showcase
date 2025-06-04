//
//  AnimatableShapeGeometryValues.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//


import SwiftUI

public struct AnimatableShapeGeometryValues: Sendable {
    var referenceSize: CGSize
    var horizontalScale: Double
   

    public init(
        referenceSize: CGSize,
        horizontalScale: Double = 1,

    ) {
        self.referenceSize = referenceSize
        self.horizontalScale = horizontalScale
    }
}

extension AnimatableShapeGeometryValues: Equatable {
    
}

extension AnimatableShapeGeometryValues: Hashable {
    
}

extension AnimatableShapeGeometryValues: Animatable {
    
    public var animatableData: AnimatablePair
    <
        CGSize.AnimatableData,
        Double
    >
    {
        get {
            AnimatablePair(
                referenceSize.animatableData,
                horizontalScale
            )
        }
        
        set {
            referenceSize.animatableData = newValue.first
            horizontalScale = newValue.second
        }
    }
    
}
