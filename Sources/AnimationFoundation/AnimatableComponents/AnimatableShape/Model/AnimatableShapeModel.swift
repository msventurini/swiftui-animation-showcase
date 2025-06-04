//
//  AnimatableShapeModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

public struct AnimatableShapeGeometryValues: Sendable {
    var referenceSize: CGSize

    public init(referenceSize: CGSize) {
        self.referenceSize = referenceSize
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
