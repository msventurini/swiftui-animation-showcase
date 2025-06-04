//
//  NSWShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//

import SwiftUI
import AnimationFoundation

struct NSWShapeData: ShapeSectionProvider {
    
    var id: SectionedShape {
        .nsw
    }
    
    var leftScreenShapeData: AnimatableShapeModel { .init(
        id: .leftScreen,
        coordinates: .init(
            topLeading: .init(x: 0, y: 0)
        ),
        cornerRadii: .init(
            topLeading: 6
        ),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 0)
            )
        ),
        geometryValues: .init(
            referenceSize: CGSize(width: 84, height: 102),
            horizontalScale: 1
        )
    )
    }
    var rightScreenShapeData: AnimatableShapeModel { .init(
        id: .rightScreen,
        horizontalInverseOf: self.leftScreenShapeData)
    }
    var leftControllerShapeData: AnimatableShapeModel { .init(
        id: .leftController, coordinates: .init(
            topLeading: .init(x: 20, y: 20),
            bottomLeading:  .init(x: 20, y: -20)
        ),
        cornerRadii: .init(
            topLeading: 20,
            bottomLeading: 20
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
    }
    
    var rightControllerShapeData: AnimatableShapeModel { .init(id: .rightController, horizontalInverseOf: self.leftControllerShapeData)
    }

}


struct NSWShapeDataDebug: View {
    
    var nswShape = NSWShapeData()
    
    var body: some View {
        
        HStack(spacing: 0) {
            ArcCornersShape(shapeModel: nswShape.leftControllerShapeData)
                .fill(.blue)
                .frame(width: 36.0, height: 102.0)
//                .aspectRatio(36.0/102 ,contentMode: .fit)
        
            ArcCornersShape(shapeModel: nswShape.leftScreenShapeData)
                .fill(.black)
                .frame(width: 84, height: 102.0)
            ArcCornersShape(shapeModel: nswShape.rightScreenShapeData)
                .fill(.black)
                .frame(width: 84, height: 102.0)
            
            ArcCornersShape(shapeModel: nswShape.rightControllerShapeData)
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
