//
//  TesteNewShape.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//


import SwiftUI

struct ShapeWithSquaredCorners: Shape {
    
    var shapeModel: AnimatableShapeModel
    
    var animatableData: AnimatableShapeModel.AnimatableData {
        
        get {
            shapeModel.animatableData
        }
        
        set {
            shapeModel.animatableData = newValue
            testeRadius = shapeModel.cornerRadii.topTrailing
        }
    }
    
    var testeRadius: Double = 0
    
    
    init(shapeModel: AnimatableShapeModel) {
        self.shapeModel = shapeModel
    }
    
    
    
    
    func path(in rect: CGRect) -> Path {
        
        let topLeadingCurveBegin = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading
        )

        let topLeadingCurveEnd = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.endAngle.radians) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.topLeading
        )
        
        let bottomLeadingCurveBegin = CGPoint(
            x: shapeModel.coordinates.bottomLeading.x + cos(shapeModel.angleValues.bottomLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomLeading,
            y: shapeModel.coordinates.bottomLeading.y - sin(shapeModel.angleValues.bottomLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomLeading
        )
//
        let bottomLeadingCurveEnd = CGPoint(
            x: shapeModel.coordinates.bottomLeading.x + cos(shapeModel.angleValues.bottomLeadingAngleValues.endAngle.radians) * shapeModel.cornerRadii.bottomLeading,
            y: shapeModel.coordinates.bottomLeading.y - sin(shapeModel.angleValues.bottomLeadingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.bottomLeading
        )
        
        let bottomTrailingCurveBegin = CGPoint(
            x: shapeModel.coordinates.bottomTrailing.x + cos(shapeModel.angleValues.bottomTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomTrailing,
            y: shapeModel.coordinates.bottomTrailing.y - sin(shapeModel.angleValues.bottomTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomTrailing
        )

        let bottomTrailingCurveEnd = CGPoint(
            x: shapeModel.coordinates.bottomTrailing.x + cos(shapeModel.angleValues.bottomTrailingAngleValues.endAngle.radians) * shapeModel.cornerRadii.bottomTrailing,
            y: shapeModel.coordinates.bottomTrailing.y - sin(shapeModel.angleValues.bottomTrailingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.bottomTrailing
        )
        
        let topTrailingCurveBegin = CGPoint(
            x: shapeModel.coordinates.topTrailing.x + cos(shapeModel.angleValues.topTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topTrailing,
            y: shapeModel.coordinates.topTrailing.y - sin(shapeModel.angleValues.topTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topTrailing
        )
//
        let topTrailingCurveEnd = CGPoint(
            x: shapeModel.coordinates.topTrailing.x + cos(shapeModel.angleValues.topTrailingAngleValues.endAngle.radians) * shapeModel.cornerRadii.topTrailing,
            y: shapeModel.coordinates.topTrailing.y - sin(shapeModel.angleValues.topTrailingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.topTrailing
        )
        
        
        var path = Path()
        
        path.move(to: topLeadingCurveBegin)
        path.addLine(to: topLeadingCurveEnd)
        
        path.addLine(to: bottomLeadingCurveBegin)
        path.addLine(to: bottomLeadingCurveEnd)
        
        
        path.addLine(to: bottomTrailingCurveBegin)
        path.addLine(to: bottomTrailingCurveEnd)
        
        path.addLine(to: topTrailingCurveBegin)
        path.addLine(to: topTrailingCurveEnd)
        
        path.closeSubpath()
        return path
        
    }
    
    
    
    
    
}
