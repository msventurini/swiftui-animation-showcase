//
//  GBCShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//

import SwiftUI
import AnimationFoundation

struct GBCShapeData: ShapeDataProvider {
    
    static let leftScreenShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 4, y: 4),
        ),
        cornerRadii: .init(topLeading: 4),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270)),
            
        ),
        geometryValues: .init(referenceSize: CGSize(width: 38, height: 64), horizontalScale: 1))
    
    static let rightScreenShapeData: AnimatableShapeModel = .init(
        horizontalInverseOf: GBCShapeData.leftScreenShapeData)
    
    static let leftControllerShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            bottomLeading: .init(x: 6, y: -16),
            bottomTrailing: .init(x: 0, y: -64)
        ),
        cornerRadii: .init(
            bottomLeading: 6,
            bottomTrailing: 64
        ),
        angleValues: .init(
            bottomTrailing: .init(startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 120)),
            bottomLeading: .init(startAngle: Angle(degrees: 120), endAngle: Angle(degrees: 180))
        ),
        
        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 38, height: 64), horizontalScale: 1)
    )
    
    static let rightControllerShapeData: AnimatableShapeModel = .init(
        horizontalInverseOf: GBCShapeData.leftControllerShapeData
    )
}


struct GBCShapeDataDebug: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                ArcCornersShape(shapeModel: GBCShapeData.leftScreenShapeData)
                ArcCornersShape(shapeModel: GBCShapeData.rightScreenShapeData)
                    .fill(.gray)
            }
            
            HStack(spacing: 0) {
                ArcCornersShape(shapeModel: GBCShapeData.leftControllerShapeData)
                    .fill(.gray)
                
                ArcCornersShape(shapeModel: GBCShapeData.rightControllerShapeData)
                    .fill(.gray)
                
            }
        }
        .aspectRatio(76/128, contentMode: .fit)
        .padding(64)
//        .frame(width: 76, height: 128)
        
        
        
    }
    
    
}

#Preview {
    GBCShapeDataDebug()
}
