//
//  GenericShape.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//


import SwiftUI

struct GenericShape: Shape {
    
    var shapeModel: AnimatableShapeModel
    
    var animatableData: AnimatableShapeModel.AnimatableData {
        
        get {
            shapeModel.animatableData
        }
        
        set {
            shapeModel.animatableData = newValue
        }
    }
    

    
    init(shapeModel: AnimatableShapeModel) {

        self.shapeModel = shapeModel

    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        
        let firstArcCenter = CGPoint(
            x: (rect.minX + rect.size.width * shapeModel.coordinates.topLeading.x),
            y: (rect.minY + rect.size.height * shapeModel.coordinates.topLeading.y))
        let firstRadius = rect.size.width * shapeModel.cornerRadii.topLeading
        path.addArc(
            
            center: firstArcCenter,
            
            radius: firstRadius,
            startAngle: shapeModel.angleValues.topLeadingAngleValues.startAngle,
            endAngle: shapeModel.angleValues.topLeadingAngleValues.endAngle,
            clockwise: false)
        
        print("first-topLeading: \(firstArcCenter), radius: \(firstRadius)")
        print("first-startAngle: \(shapeModel.angleValues.topLeadingAngleValues.startAngle.degrees)")
        print("first-endAngle: \(shapeModel.angleValues.topLeadingAngleValues.endAngle.degrees)")
        
        let secondArcCenter = CGPoint(
            x: rect.maxX + rect.size.width * shapeModel.coordinates.topTrailing.x,
            y: rect.minY + rect.size.height * shapeModel.coordinates.topTrailing.y)
        
        let secondRadius = rect.size.width * shapeModel.cornerRadii.topTrailing

        
        path.addArc(
            center: secondArcCenter,
            radius: secondRadius,
            startAngle: shapeModel.angleValues.topTrailingAngleValues.startAngle,
            endAngle: shapeModel.angleValues.topTrailingAngleValues.endAngle,
            clockwise: false)
        
        print("second-topTrailing: \(secondArcCenter), radius: \(secondRadius)")
        print("second-startAngle: \(shapeModel.angleValues.topTrailingAngleValues.startAngle.degrees)")
        print("second-endAngle: \(shapeModel.angleValues.topTrailingAngleValues.endAngle.degrees)")
        let thirdArcCenter = CGPoint(
            x: rect.maxX + rect.size.width * shapeModel.coordinates.bottomTrailing.x,
            y: rect.maxY + rect.size.height * shapeModel.coordinates.bottomTrailing.y)
        
        let thirdRadius = rect.size.width * shapeModel.cornerRadii.bottomTrailing

        path.addArc(
            center: thirdArcCenter,
            radius: thirdRadius,
            startAngle: shapeModel.angleValues.bottomTrailingAngleValues.startAngle,
            endAngle: shapeModel.angleValues.bottomTrailingAngleValues.endAngle,
            clockwise: false
        )
        
        print("third-bottomTrailing: \(thirdArcCenter), radius: \(thirdRadius)")
        print("third-startAngle: \(shapeModel.angleValues.bottomTrailingAngleValues.startAngle.degrees)")
        print("third-endAngle: \(shapeModel.angleValues.bottomTrailingAngleValues.endAngle.degrees)")
        
        

        let fourthArcCenter = CGPoint(x: rect.minX + rect.size.width * shapeModel.coordinates.bottomLeading.x, y: rect.maxY + rect.size.height * shapeModel.coordinates.bottomLeading.y)
        
        let fourthRadius = rect.size.width * shapeModel.cornerRadii.bottomLeading

        
        path.addArc(
            center: fourthArcCenter,
            radius: fourthRadius,
            startAngle: shapeModel.angleValues.bottomLeadingAngleValues.startAngle,
            endAngle: shapeModel.angleValues.bottomLeadingAngleValues.endAngle,
            clockwise: false
        )
        print("fourth-bottomTrailing: \(fourthArcCenter), radius: \(fourthRadius)")
        print("third-startAngle: \(shapeModel.angleValues.bottomLeadingAngleValues.startAngle.degrees)")
        print("third-endAngle: \(shapeModel.angleValues.bottomLeadingAngleValues.endAngle.degrees)")

        path.closeSubpath()
        return path
    }
    
    
}
