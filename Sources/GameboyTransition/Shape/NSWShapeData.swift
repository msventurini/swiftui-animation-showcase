//
//  NSWShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//

import SwiftUI
import AnimationFoundation

struct NSWShapeData: ShapeDataProvider {
    
    static let screenShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 0, y: 0),
            topTrailing: .init(x: 0, y: 0)
        ),
        cornerRadii: .init(
            topLeading: 6,
            topTrailing: 6
        ),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 0)
            ),
            topTrailing: .init(
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 90)
            )
        ),
        geometryValues: .init(
            referenceSize: CGSize(width: 168, height: 102),
            horizontalScale: 1
        )
    )
    
    static let leftControllerShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 22, y: 22),
            bottomLeading:  .init(x: 22, y: -22)
        ),
        cornerRadii: .init(
            topLeading: 22,
            bottomLeading: 22
        ),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270)),
            bottomLeading: .init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180)
            )
        ),
        geometryValues: AnimatableShapeGeometryValues(
            referenceSize:  CGSize(width: 29.6, height: 82.0),
            horizontalScale: 1
        )
    )
    
    
    static let rightControllerShapeData: AnimatableShapeModel = .init(horizontalInverseOf: NSWShapeData.leftControllerShapeData)

}


struct NSWShapeDataDebug: View {
    
    var body: some View {
        
        HStack(spacing: 0) {
            ArcCornersShape(shapeModel: NSWShapeData.leftControllerShapeData)
                .fill(.blue)
                .frame(width: 36.0, height: 102.0)
//                .aspectRatio(36.0/102 ,contentMode: .fit)
        
            ArcCornersShape(shapeModel: NSWShapeData.screenShapeData)
                .fill(.black)
//                .aspectRatio(168/102 ,contentMode: .fit)
                .frame(width: 168, height: 102.0)

            
            ArcCornersShape(shapeModel: NSWShapeData.rightControllerShapeData)
                .fill(.red)
//                .aspectRatio(36.0/102 ,contentMode: .fit)
                .frame(width: 36.0, height: 102.0)

            
        }
        .frame(width: 240, height: 102)
        
        
    }
    
    
}

#Preview {
    NSWShapeDataDebug()
}
