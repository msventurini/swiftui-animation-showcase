//
//  GBShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//


import SwiftUI
import AnimationFoundation

struct GBShapeData: ShapeDataProvider {
    
    static let leftScreenShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 8, y: 8),
        ),
        cornerRadii: .init(topLeading: 8),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270)),
        ),
        geometryValues: .init(referenceSize: CGSize(width: 45, height: 74), horizontalScale: 1))
    
    static let rightScreenShapeData: AnimatableShapeModel = .init(
        horizontalInverseOf: leftScreenShapeData)
    
    static let leftControllerShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            bottomLeading: .init(x: 8, y: -8),
        ),
        cornerRadii: .init(
            bottomLeading: 8,
        ),
        angleValues: .init(
            bottomLeading: .init(startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180))),
        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 45, height: 74), horizontalScale: 1)
    )
    
    static let rightControllerShapeData: AnimatableShapeModel = .init(
        horizontalInverseOf: GBShapeData.leftControllerShapeData,
        changingCoordinatesTo: .init(
            bottomLeading: .init(x: 32, y: -32)
        ),
        changingCornerRadiiTo: .init(
            bottomLeading: 32
        ),
        changingAngleValuesTo: .init(
            bottomLeading:.init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180))
        )
    )
}


struct GBShapeDataDebug: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                ArcCornersShape(shapeModel: GBShapeData.leftScreenShapeData)
                    .fill(.black)
                ArcCornersShape(shapeModel: GBShapeData.rightScreenShapeData)
                    .fill(.gray)
            }
            
            
            
            HStack(spacing: 0) {
                ArcCornersShape(shapeModel: GBShapeData.leftControllerShapeData)
                    .fill(.gray)
                
                ArcCornersShape(shapeModel: GBShapeData.rightControllerShapeData)
                    .fill(.gray)
                
            }
        }
//        .aspectRatio(90/148, contentMode: .fit)
        .frame(width: 90, height: 148)
        
        
        
    }
    
    
}

#Preview {
    GBShapeDataDebug()
}
