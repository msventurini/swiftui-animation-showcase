//
//  GBAShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//


import SwiftUI
import AnimationFoundation

struct GBAShapeData: ShapeSectionProvider {
    let width: CGFloat = 148
    
    let height: CGFloat = 82
    
    
    var id: SectionedShapeLegacy {
        .gba
    }
    
    var leftScreenShapeData: AnimatableShapeModel { .init(
        coordinates: .init(
            topLeading: .init(x: 12, y: 20),
            bottomLeading: .init(x: 23, y: -60),
        ),
        cornerRadii: .init(
            topLeading: 20,
            bottomLeading: 60,
        ),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 230),
                endAngle: Angle(degrees: 270)),
            bottomLeading: .init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 127))),
        
        geometryValues: .init(referenceSize: CGSize(width: 44, height: 82), horizontalScale: 1))
    }
    var rightScreenShapeData: AnimatableShapeModel {
        .init(
            horizontalInverseOf: self.leftScreenShapeData)
    }
    
    var leftControllerShapeData: AnimatableShapeModel {
        .init(
            coordinates: .init(
                topLeading: .init(x: 14, y: 14),
                topTrailing: .init(x: -14, y: -38),
                bottomLeading: .init(x: 26, y: -32),
                bottomTrailing: .init(x: -21.5, y: 47)
            ),
            cornerRadii: .init(
                topLeading: 8,
                bottomLeading: 24,
                bottomTrailing: 56,
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
                bottomTrailing: .init(startAngle: Angle(degrees: -62), endAngle: Angle(degrees: -78)),
                //            bottomTrailing: .init(startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 40)),
                bottomLeading: .init(startAngle: Angle(degrees: 115), endAngle: Angle(degrees: 180))),
            geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 30, height: 82.0), horizontalScale: 1)
        )
        
    }
    
    var rightControllerShapeData: AnimatableShapeModel { .init(horizontalInverseOf: self.leftControllerShapeData)
    }
}


struct GBAShapeDataDebug: View {
    
    var gbaShape = GBAShapeData()
    
    //    var body: some View {
    //
    //        var gbaShape = GBAShapeData()
    var nswShape = NSWShapeData()
    
    @State var isTapped: Bool = false
    
    var controllerAspectRatio: Double {
        isTapped ? 0.3529411765 : 0.3658536585
    }
    
    var screenAspectRatio: Double {
        isTapped ? 0.8235294118 : 0.5365853659
    }
    
    var consoleAspectRatio: Double {
        isTapped ? 2.3529411765 : 1.8048
    }
    
    var leftControllerShape: AnimatableShapeModel {
        isTapped ? nswShape.leftControllerShapeData : gbaShape.leftControllerShapeData
    }
    
    var rightControllerShape: AnimatableShapeModel {
        isTapped ? nswShape.rightControllerShapeData : gbaShape.rightControllerShapeData
    }
    
    var leftScreenShape: AnimatableShapeModel {
        isTapped ? nswShape.leftScreenShapeData : gbaShape.leftScreenShapeData
    }
    
    var rightScreenShape: AnimatableShapeModel {
        isTapped ? nswShape.rightScreenShapeData : gbaShape.rightScreenShapeData
    }
    
    var leftControllerColor: Color {
        isTapped ? .blue : .indigo
    }
    
    var rightControllerColor: Color {
        isTapped ? .red : .indigo
    }
    
    var screenColor: Color {
        isTapped ? .black : .indigo
    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            ArcCornersShape(shapeModel: leftControllerShape)
                .fill(leftControllerColor)
                .aspectRatio(controllerAspectRatio ,contentMode: .fit)
                .zIndex(2)
            ArcCornersShape(shapeModel: leftScreenShape)
                .fill(screenColor)
                .aspectRatio(screenAspectRatio ,contentMode: .fit)
                .zIndex(0)
            ArcCornersShape(shapeModel: rightScreenShape)
                .fill(screenColor)
                .aspectRatio(screenAspectRatio ,contentMode: .fit)
                .zIndex(0)
            ArcCornersShape(shapeModel: rightControllerShape)
                .fill(rightControllerColor)
                .aspectRatio(controllerAspectRatio ,contentMode: .fit)
                .zIndex(2)
        }
        .aspectRatio(consoleAspectRatio, contentMode: .fit)
        .frame(maxWidth: .infinity)
        .padding()
        .aspectRatio(1, contentMode: .fit)
        .frame(maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            Button {
                withAnimation(.snappy) {
                    isTapped.toggle()
                }
            } label: {
                Text("togle")
            }
        }
        
        
        
    }
    
    
}

#Preview {
    GBAShapeDataDebug()
}
