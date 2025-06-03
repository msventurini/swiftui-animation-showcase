//
//  AnimatableShapeModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

struct AnimatableShapeModel: Sendable {
    var coordinates: AnimatableShapePropotionalCoordinates
    var cornerRadii: RectangleCornerRadii
    var angleValues: AnimatableShapeAngleValues
    let leadingHorizontalReference: AnimatableShapeModel.HorizontalReferencePoint
    let trailingHorizontalReference: AnimatableShapeModel.HorizontalReferencePoint
    let topVerticalReference: AnimatableShapeModel.VerticalReferencePoint
    let bottomVerticalReference: AnimatableShapeModel.VerticalReferencePoint
   
    init(
        coordinates: AnimatableShapePropotionalCoordinates,
        cornerRadii: RectangleCornerRadii,
        angleValues: AnimatableShapeAngleValues,
        leadingHorizontalReference: AnimatableShapeModel.HorizontalReferencePoint = .minX,
        trailingHorizontalReference: AnimatableShapeModel.HorizontalReferencePoint = .maxX,
        topVerticalReference: AnimatableShapeModel.VerticalReferencePoint = .minY,
        bottomVerticalReference: AnimatableShapeModel.VerticalReferencePoint = .maxY
        
        
    ) {
        self.coordinates = coordinates
        self.cornerRadii = cornerRadii
        self.angleValues = angleValues
        self.leadingHorizontalReference = leadingHorizontalReference
        self.trailingHorizontalReference = trailingHorizontalReference
        self.topVerticalReference = topVerticalReference
        self.bottomVerticalReference = bottomVerticalReference 
    }
    
}
