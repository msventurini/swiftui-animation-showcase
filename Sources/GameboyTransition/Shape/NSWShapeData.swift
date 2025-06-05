//
//  NSWShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//

import SwiftUI
import AnimationFoundation

struct NSWShapeData: ShapeSectionProvider {
    var width: CGFloat = 240
    
    var height: CGFloat = 102
    
    
    var id: SectionedShapeLegacy {
        .nsw
    }
    
    var leftScreenShapeData: AnimatableShapeModel { .init(
        
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
        horizontalInverseOf: self.leftScreenShapeData)
    }
    var leftControllerShapeData: AnimatableShapeModel { .init(
        coordinates: .init(
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
    
    var rightControllerShapeData: AnimatableShapeModel { .init(horizontalInverseOf: self.leftControllerShapeData)
    }

}


struct NSWShapeDataDebug: View {
    
    var nswShape = NSWShapeData()
    
    var body: some View {
        
        HStack(spacing: 0) {
            ArcCornersShape(shapeModel: nswShape.leftControllerShapeData)
                .fill(.blue)
                .aspectRatio(36/102, contentMode: .fit)

            ArcCornersShape(shapeModel: nswShape.leftScreenShapeData)
                .fill(.black)
                .aspectRatio(84/102, contentMode: .fit)

//                .frame(width: 84, height: 102.0)
            ArcCornersShape(shapeModel: nswShape.rightScreenShapeData)
                .fill(.black)
                .aspectRatio(84/102, contentMode: .fit)

            ArcCornersShape(shapeModel: nswShape.rightControllerShapeData)
                .fill(.red)
                .aspectRatio(36/102, contentMode: .fit)

            
        }
        .aspectRatio(240/102, contentMode: .fit)
        .frame(maxWidth: .infinity)
        .padding()
        .aspectRatio(1, contentMode: .fit)
        
    }
    
    
}

#Preview {
    NSWShapeDataDebug()
}
