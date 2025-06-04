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
    
    var widthRatioToContainer: Double
    var heightRatioToContainer: Double
    var containerWidth: Double
    var containerHeight: Double
    var width: Double
    var height: Double
    var centerPointX: Double
    var centerPointY: Double
    var centerDistanceX: Double
    var centerDistanceY: Double

    init(
        referenceSize: CGSize,
        horizontalScale: Double,
        originX: Double,
        originY: Double,
        widthRatioToContainer: Double,
        heightRatioToContainer: Double,
        containerWidth: Double,
        containerHeight: Double,
        width: Double,
        height: Double,
    ) {
        self.referenceSize = referenceSize
        self.horizontalScale = horizontalScale
        self.widthRatioToContainer = widthRatioToContainer
        self.heightRatioToContainer = heightRatioToContainer
        self.containerWidth = containerWidth
        self.containerHeight = containerHeight
        self.width = width
        self.height = height
        
        self.widthRatioToContainer = widthRatioToContainer
        self.heightRatioToContainer = heightRatioToContainer
        
        self.containerWidth = containerWidth
        self.containerHeight = containerWidth
        self.width = containerWidth * widthRatioToContainer
        self.height = containerHeight * heightRatioToContainer
        
        let centerX = (originX + (widthRatioToContainer * 0.5)) - 0.5
        let centerY = (originY + (heightRatioToContainer * 0.5)) - 0.5
        self.centerPointX = centerX
        self.centerPointY = centerY
        
        self.centerDistanceX = centerX * containerWidth
        self.centerDistanceY = centerY * containerHeight
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



public struct AnimatableShapeModel: Sendable, Identifiable {
    
    public var id: ShapeSection
    
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
        id: ShapeSection,
        coordinates: AnimatableShapePropotionalCoordinates,
        cornerRadii: AnimatableCornerRadii,
        angleValues: AnimatableShapeAngleValues,
        geometryValues: AnimatableShapeGeometryValues
    ) {
        self.id = id
        self.coordinates = coordinates
        self.cornerRadii = cornerRadii
        self.angleValues = angleValues
        self.geometryValues = geometryValues
    }
    
    public init(
        id: ShapeSection,
        horizontalInverseOf shapeModel: AnimatableShapeModel,
        changingCoordinatesTo coordinates: AnimatableShapePropotionalCoordinates? = nil,
        changingCornerRadiiTo cornerRadii: AnimatableCornerRadii? = nil,
        changingAngleValuesTo angleValues: AnimatableShapeAngleValues? = nil
    ) {
        self.id = id
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


//
//public enum ShapeSection: Int, Identifiable, CaseIterable, Hashable, Sendable {
//    
//    public var id: Int {
//        return rawValue
//    }
//    
//    case leftScreen = 0
//    case rightScreen
//    case leftController
//    case rightController
//    
//}




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
