//
//  GBShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//


import SwiftUI
import AnimationFoundation

struct GBShapeData: ShapeSectionProvider {
    let width: CGFloat = 90
    
    let height: CGFloat = 148
    
    
    var id: SectionedShapeLegacy {
        .gb
    }
    var leftScreenShapeData: AnimatableShapeModel { .init(
        
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
    }
    
    var rightScreenShapeData: AnimatableShapeModel { .init(
        horizontalInverseOf: leftScreenShapeData)
    }
    var leftControllerShapeData: AnimatableShapeModel { .init(
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
    }
    var rightControllerShapeData: AnimatableShapeModel { .init(
        horizontalInverseOf: self.leftControllerShapeData,
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
}


struct GBShapeDataDebug: View {
    
    var gbShape = GBShapeData()
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                ArcCornersShape(shapeModel: gbShape.leftScreenShapeData)
                    .fill(.gray)
                ArcCornersShape(shapeModel: gbShape.rightScreenShapeData)
                    .fill(.gray)
            }
            HStack(spacing: 0) {
                ArcCornersShape(shapeModel: gbShape.leftControllerShapeData)
                    .fill(.gray)
                
                ArcCornersShape(shapeModel: gbShape.rightControllerShapeData)
                    .fill(.gray)
                
            }
        }
        .aspectRatio(90/148, contentMode: .fit)
        .frame(maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        
        
    }
    
    
}

#Preview {
    GBShapeDataDebug()
}
