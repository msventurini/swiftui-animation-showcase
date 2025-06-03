//
//  ShapeWithArcCorners.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//


import SwiftUI

public struct ArcCornersShape: Shape {
    
    public var shapeModel: AnimatableShapeModel
    
    public init(shapeModel: AnimatableShapeModel) {
        self.shapeModel = shapeModel
    }
    
    public func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        
        let topLeadingCurveBegin = MathUtils.cgPointRelativeToArc(located: .beforeCurve, atCoordinates: shapeModel.coordinates.topLeading, withRadius: shapeModel.cornerRadii.topLeading, withAngles: shapeModel.angleValues.topLeadingAngleValues)

//        let topLeadingCurveBegin = CGPoint(
//            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading,
//            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading
//        )
        
        path.move(to: topLeadingCurveBegin)
        
        shapeModel
            .allVertices(in: rect)
            .forEach { vertex in
                
                    path.addRelativeArc(
                        center: vertex.coordinates,
                        radius: vertex.cornerRadius,
                        startAngle: vertex.angleValues.startAngle,
                        delta: vertex.angleValues.delta)
                    print(vertex.cornerRadius)
                
            }
        
        path.closeSubpath()
        return path
        
    }
    
}

extension ArcCornersShape: Animatable {
    public var animatableData: AnimatableShapeModel.AnimatableData {
        
        get {
            shapeModel.animatableData
        }
        
        set {
            shapeModel.animatableData = newValue
        }
    }
}
