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
            startAngle: shapeModel.angleValues.topLeading.startAngle,
            endAngle: shapeModel.angleValues.topLeading.endAngle,
            clockwise: false)
        
        print("first-topLeading: \(firstArcCenter), radius: \(firstRadius)")
        print("first-startAngle: \(shapeModel.angleValues.topLeading.startAngle.degrees)")
        print("first-endAngle: \(shapeModel.angleValues.topLeading.endAngle.degrees)")
        
        let secondArcCenter = CGPoint(
            x: rect.maxX + rect.size.width * shapeModel.coordinates.topTrailing.x,
            y: rect.minY + rect.size.height * shapeModel.coordinates.topTrailing.y)
        
        let secondRadius = rect.size.width * shapeModel.cornerRadii.topTrailing

        
        path.addArc(
            center: secondArcCenter,
            radius: secondRadius,
            startAngle: shapeModel.angleValues.topTrailing.startAngle,
            endAngle: shapeModel.angleValues.topTrailing.endAngle,
            clockwise: false)
        
        print("second-topTrailing: \(secondArcCenter), radius: \(secondRadius)")
        print("second-startAngle: \(shapeModel.angleValues.topTrailing.startAngle.degrees)")
        print("second-endAngle: \(shapeModel.angleValues.topTrailing.endAngle.degrees)")
        let thirdArcCenter = CGPoint(
            x: rect.maxX + rect.size.width * shapeModel.coordinates.bottomTrailing.x,
            y: rect.maxY + rect.size.height * shapeModel.coordinates.bottomTrailing.y)
        
        let thirdRadius = rect.size.width * shapeModel.cornerRadii.bottomTrailing

        path.addArc(
            center: thirdArcCenter,
            radius: thirdRadius,
            startAngle: shapeModel.angleValues.bottomTrailing.startAngle,
            endAngle: shapeModel.angleValues.bottomTrailing.endAngle,
            clockwise: false
        )
        
        print("third-bottomTrailing: \(thirdArcCenter), radius: \(thirdRadius)")
        print("third-startAngle: \(shapeModel.angleValues.bottomTrailing.startAngle.degrees)")
        print("third-endAngle: \(shapeModel.angleValues.bottomTrailing.endAngle.degrees)")
        
        

        let fourthArcCenter = CGPoint(x: rect.minX + rect.size.width * shapeModel.coordinates.bottomLeading.x, y: rect.maxY + rect.size.height * shapeModel.coordinates.bottomLeading.y)
        
        let fourthRadius = rect.size.width * shapeModel.cornerRadii.bottomLeading

        
        path.addArc(
            center: fourthArcCenter,
            radius: fourthRadius,
            startAngle: shapeModel.angleValues.bottomLeading.startAngle,
            endAngle: shapeModel.angleValues.bottomLeading.endAngle,
            clockwise: false
        )
        print("fourth-bottomLeading: \(fourthArcCenter), radius: \(fourthRadius)")
        print("fourth-startAngle: \(shapeModel.angleValues.bottomLeading.startAngle.degrees)")
        print("fourth-endAngle: \(shapeModel.angleValues.bottomLeading.endAngle.degrees)")

        path.closeSubpath()
        return path
    }
    
    
}
