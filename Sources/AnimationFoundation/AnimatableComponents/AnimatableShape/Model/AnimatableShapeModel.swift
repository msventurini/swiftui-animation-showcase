//
//  AnimatableShapeModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

public struct AnimatableShapeGeometryValues: Sendable {
    var referenceSize: CGSize
    var horizontalScale: Double
    
    public init(referenceSize: CGSize, horizontalScale: Double = 1) {
        self.referenceSize = referenceSize
        self.horizontalScale = horizontalScale
    }
    
    
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


public struct AnimatableShapeModel: Sendable {
    var coordinates: AnimatableShapePropotionalCoordinates
    var cornerRadii: RectangleCornerRadii
    var angleValues: AnimatableShapeAngleValues
    var geometryValues: AnimatableShapeGeometryValues
    
    public init(
        coordinates: AnimatableShapePropotionalCoordinates,
        cornerRadii: RectangleCornerRadii,
        angleValues: AnimatableShapeAngleValues,
        geometryValues: AnimatableShapeGeometryValues
    ) {
        self.coordinates = coordinates
        self.cornerRadii = cornerRadii
        self.angleValues = angleValues
        self.geometryValues = geometryValues
    }
    
    public init(
        horizontalInverseOf shapeModel: AnimatableShapeModel,
        changingCoordinatesTo coordinates: AnimatableShapePropotionalCoordinates? = nil,
        changingCornerRadiiTo cornerRadii: RectangleCornerRadii? = nil,
        changingAngleValuesTo angleValues: AnimatableShapeAngleValues? = nil
    ) {
        
        if let coordinates {
            self.coordinates = coordinates
        } else {
            self.coordinates = shapeModel.coordinates
        }
        
        if let cornerRadii {
            self.cornerRadii = cornerRadii
        } else {
            self.cornerRadii = shapeModel.cornerRadii
        }
        
        if let angleValues {
            self.angleValues = angleValues
        } else {
            self.angleValues = shapeModel.angleValues
        }
        
        
        self.geometryValues = .init(
            referenceSize: shapeModel.geometryValues.referenceSize,
            horizontalScale: shapeModel.geometryValues.horizontalScale * -1
        )
    }
    
    
    
    public static let zero: AnimatableShapeModel = .init(
        coordinates: AnimatableShapePropotionalCoordinates.zero,
        cornerRadii: .init(
            topLeading: .zero,
            bottomLeading: .zero,
            bottomTrailing: .zero,
            topTrailing: .zero),
        angleValues: AnimatableShapeAngleValues.zero,
        geometryValues: .init(referenceSize: .zero)
    )
    
}
