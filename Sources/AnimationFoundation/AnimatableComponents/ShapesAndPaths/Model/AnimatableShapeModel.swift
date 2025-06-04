//
//  AnimatableShapeModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI


public struct AnimatableShapeModel: Sendable, Identifiable {
    
    public let id: UUID = UUID()
    
    var coordinates: AnimatableShapePropotionalCoordinates
    var cornerRadii: AnimatableCornerRadii
    var angleValues: AnimatableShapeAngleValues
    var geometryValues: AnimatableShapeGeometryValues
    
    public var referenceWidth: Double {
        return geometryValues.referenceSize.width
    }
    
    public var referenceHeight: Double {
        return geometryValues.referenceSize.height
    }
    
    public init(
        coordinates: AnimatableShapePropotionalCoordinates,
        cornerRadii: AnimatableCornerRadii,
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
        changingCornerRadiiTo cornerRadii: AnimatableCornerRadii? = nil,
        changingAngleValuesTo angleValues: AnimatableShapeAngleValues? = nil,
        changingGeometryValues geometryValues: AnimatableShapeGeometryValues? = nil
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
    
    
}

extension AnimatableShapeModel: Equatable {
    
}

extension AnimatableShapeModel: Hashable {
    
}



