//
//  ShapeDataTesting.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//

import SwiftUI
import AnimationFoundation


struct GameBoyAdvanceShapeData {
    
    static let screenShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 6, y: 6),
            topTrailing: .init(x: -6, y: 6),
            bottomLeading: .init(x: 24, y: -40),
            bottomTrailing: .init(x: -24, y: -40)),
        cornerRadii: .init(
            topLeading: 8,
            bottomLeading: 40,
            bottomTrailing: 40,
            topTrailing: 8),
        angleValues: .init(
            topLeadingAngleValues: .init(
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270)),
            topTrailingAngleValues: .init(
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 360)),
            bottomTrailingAngleValues: .init(
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90)),
            bottomLeadingAngleValues: .init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180))),

        geometryValues: .init(referenceSize: CGSize(width: 88, height: 82), horizontalScale: 1))
    
    
    
    
    static let leftControllerShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 9.5, y: 18.04),
            topTrailing: .init(x: 0, y: 3.28),
            bottomLeading: .init(x: 14.83, y: -25),
            bottomTrailing: .init(x: 0, y: -8)
        ),
        cornerRadii: .init(
            topLeading: 6.52,
            bottomLeading: 14.8,
            bottomTrailing: 0,
            topTrailing: 0
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 40)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180))),
        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 29.6, height: 82.0), horizontalScale: 1)
    )
    
    static let rightControllerShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 9.5, y: 18.04),
            topTrailing: .init(x: 0, y: 3.28),
            bottomLeading: .init(x: 14.83, y: -25),
            bottomTrailing: .init(x: 0, y: -8)
        ),
        cornerRadii: .init(
            topLeading: 6.52,
            bottomLeading: 14.8,
            bottomTrailing: 0,
            topTrailing: 0
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 40)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180))),
        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 29.6, height: 82.0), horizontalScale: -1)
    )
}


struct ShapeDataTesting: View {
    
    var body: some View {
        
        HStack(spacing: 0) {
            ArcCornersShape(shapeModel: GameBoyAdvanceShapeData.leftControllerShapeData)
                .aspectRatio(29.6/82.0 ,contentMode: .fit)
        
            ArcCornersShape(shapeModel: GameBoyAdvanceShapeData.screenShapeData)
                .aspectRatio(88.8/82 ,contentMode: .fit)
               
            
            ArcCornersShape(shapeModel: GameBoyAdvanceShapeData.rightControllerShapeData)
                .aspectRatio(29.6/82.0 ,contentMode: .fit)
          
            
        }
        .frame(width: 148, height: 82)
        
        
    }
    
    
}

#Preview {
    ShapeDataTesting()
}
