//
//  AnimatableShapeModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

public struct AnimatableShapeModel: Sendable {
    var coordinates: AnimatableShapePropotionalCoordinates
    var cornerRadii: RectangleCornerRadii
    var angleValues: AnimatableShapeAngleValues
    var referenceSize: CGSize
   
    public init(
        coordinates: AnimatableShapePropotionalCoordinates,
        cornerRadii: RectangleCornerRadii,
        angleValues: AnimatableShapeAngleValues,
        referenceSize: CGSize
    ) {
        self.coordinates = coordinates
        self.cornerRadii = cornerRadii
        self.angleValues = angleValues
        self.referenceSize = referenceSize
    }
    
    public static let zero: AnimatableShapeModel = .init(
        coordinates: AnimatableShapePropotionalCoordinates.zero,
        cornerRadii: .init(
            topLeading: .zero,
            bottomLeading: .zero,
            bottomTrailing: .zero,
            topTrailing: .zero),
        angleValues: AnimatableShapeAngleValues.zero,
        referenceSize: .zero
    )
    
}
