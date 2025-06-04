//
//  GBAShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//


import SwiftUI
import AnimationFoundation

struct GBAShapeData: ShapeDataProvider {
    
    static let screenShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 12, y: 20),
            topTrailing: .init(x: -12, y: 20),
            bottomLeading: .init(x: 24, y: -40),
            bottomTrailing: .init(x: -24, y: -40)),
        cornerRadii: .init(
            topLeading: 20,
            bottomLeading: 40,
            bottomTrailing: 40,
            topTrailing: 20),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 240),
                endAngle: Angle(degrees: 270)),
            topTrailing: .init(
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 300)),
            bottomTrailing: .init(
                startAngle: Angle(degrees: 50),
                endAngle: Angle(degrees: 90)),
            bottomLeading: .init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 130))),

        geometryValues: .init(referenceSize: CGSize(width: 88, height: 82), horizontalScale: 1))
    
    static let leftControllerShapeData: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 14, y: 14),
            topTrailing: .init(x: -16, y: -38),
            bottomLeading: .init(x: 26, y: -36),
            bottomTrailing: .init(x: 0, y: -8)
        ),
        cornerRadii: .init(
            topLeading: 8,
            bottomLeading: 24,
            topTrailing: 44
        ),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 240)),
            topTrailing: .init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 64)
            ),
            bottomTrailing: .init(startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 40)),
            bottomLeading: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180))),
        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 30, height: 82.0), horizontalScale: 1)
    )
    
    
    static let rightControllerShapeData: AnimatableShapeModel = .init(horizontalInverseOf: GBAShapeData.leftControllerShapeData)

}


struct GBAShapeDataDebug: View {
    
    var body: some View {
        
        HStack(spacing: 0) {
            ArcCornersShape(shapeModel: GBAShapeData.leftControllerShapeData)
                .fill(.indigo)
                .stroke(.black, lineWidth: 1)

                .aspectRatio(30/82.0 ,contentMode: .fit)
                .opacity(0.05)
        
            ArcCornersShape(shapeModel: GBAShapeData.screenShapeData)
                .fill(.indigo)
                .stroke(.black, lineWidth: 1)

                .aspectRatio(88/82 ,contentMode: .fit)
                .opacity(0.15)
            
            ArcCornersShape(shapeModel: GBAShapeData.rightControllerShapeData)
                .fill(.indigo)
                .stroke(.black, lineWidth: 1)

                .aspectRatio(30/82.0 ,contentMode: .fit)
                .opacity(0.05)
            
        }
        .frame(width: 148, height: 82)
        .background(.red.opacity(0.2))
        
        
        
    }
    
    
}

#Preview {
    GBAShapeDataDebug()
}

//struct GBAShapeDataBKP: ShapeDataProvider {
//    
//    static let screenShapeData: AnimatableShapeModel = .init(
//        coordinates: .init(
//            topLeading: .init(x: 6, y: 8),
//            topTrailing: .init(x: -6, y: 8),
//            bottomLeading: .init(x: 24, y: -40),
//            bottomTrailing: .init(x: -24, y: -40)),
//        cornerRadii: .init(
//            topLeading: 8,
//            bottomLeading: 40,
//            bottomTrailing: 40,
//            topTrailing: 8),
//        angleValues: .init(
//            topLeading: .init(
//                startAngle: Angle(degrees: 180),
//                endAngle: Angle(degrees: 270)),
//            topTrailing: .init(
//                startAngle: Angle(degrees: 270),
//                endAngle: Angle(degrees: 360)),
//            bottomTrailing: .init(
//                startAngle: Angle(degrees: 50),
//                endAngle: Angle(degrees: 90)),
//            bottomLeading: .init(
//                startAngle: Angle(degrees: 90),
//                endAngle: Angle(degrees: 130))),
//
//        geometryValues: .init(referenceSize: CGSize(width: 88, height: 82), horizontalScale: 1))
//    
//    static let leftControllerShapeData: AnimatableShapeModel = .init(
//        coordinates: .init(
//            topLeading: .init(x: 9.5, y: 18.04),
//            topTrailing: .init(x: 0, y: 3.28),
//            bottomLeading: .init(x: 14.83, y: -25),
//            bottomTrailing: .init(x: 0, y: -8)
//        ),
//        cornerRadii: .init(
//            topLeading: 6.52,
//            bottomLeading: 14.8
//        ),
//        angleValues: .init(
//            topLeading: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
//            bottomTrailing: .init(startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 40)),
//            bottomLeading: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180))),
//        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 29.6, height: 82.0), horizontalScale: 1)
//    )
//    
//    
//    static let rightControllerShapeData: AnimatableShapeModel = .init(horizontalInverseOf: GBAShapeData.leftControllerShapeData)
//
//}
