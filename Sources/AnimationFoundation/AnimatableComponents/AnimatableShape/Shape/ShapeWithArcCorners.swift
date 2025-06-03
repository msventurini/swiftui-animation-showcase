//
//  ShapeWithArcCorners.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//


import SwiftUI

struct ShapeWithArcCorners: Shape {
    
    var shapeModel: AnimatableShapeModel
    
    init(shapeModel: AnimatableShapeModel) {
        self.shapeModel = shapeModel
    }
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        let topLeadingCurveBegin = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading
        )
        
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

extension ShapeWithArcCorners: Animatable {
    var animatableData: AnimatableShapeModel.AnimatableData {
        
        get {
            shapeModel.animatableData
        }
        
        set {
            shapeModel.animatableData = newValue
        }
    }
}
