//
//  AnimatableShapeModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

#Preview {
    TesteNewMorphingShape()
//    TesteMorphingShape()
//        .aspectRatio(29.6 / 82.0,contentMode: .fit)
}

struct AnimatableShapeModel2: Sendable {
    var coordinates: AnimatableShapePropotionalCoordinates
    var cornerRadii: RectangleCornerRadii

    let leadingHorizontalReference: AnimatableShapeModel.HorizontalReferencePoint
    let trailingHorizontalReference: AnimatableShapeModel.HorizontalReferencePoint
    let topVerticalReference: AnimatableShapeModel.VerticalReferencePoint
    let bottomVerticalReference: AnimatableShapeModel.VerticalReferencePoint
   
    init(
        coordinates: AnimatableShapePropotionalCoordinates,
        cornerRadii: RectangleCornerRadii,
        leadingHorizontalReference: AnimatableShapeModel.HorizontalReferencePoint = .minX,
        trailingHorizontalReference: AnimatableShapeModel.HorizontalReferencePoint = .maxX,
        topVerticalReference: AnimatableShapeModel.VerticalReferencePoint = .minY,
        bottomVerticalReference: AnimatableShapeModel.VerticalReferencePoint = .maxY
        
        
    ) {
        self.coordinates = coordinates
        self.cornerRadii = cornerRadii
        self.leadingHorizontalReference = leadingHorizontalReference
        self.trailingHorizontalReference = trailingHorizontalReference
        self.topVerticalReference = topVerticalReference
        self.bottomVerticalReference = bottomVerticalReference
    }
    
}

struct TesteNewShape: Shape {
    
    var shapeModel: AnimatableShapeModel
    
    var animatableData: AnimatableShapeModel.AnimatableData {
        
        get {
            shapeModel.animatableData
        }
        
        set {
            shapeModel.animatableData = newValue
            testeRadius = shapeModel.cornerRadii.topTrailing
        }
    }
    
    var testeRadius: Double = 0
    
    
    init(shapeModel: AnimatableShapeModel) {
        self.shapeModel = shapeModel
    }
    
    
    
    
    func path(in rect: CGRect) -> Path {
        
        let topLeadingCurveBegin = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading
        )

        let topLeadingCurveEnd = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.endAngle.radians) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.topLeading
        )
        
        let bottomLeadingCurveBegin = CGPoint(
            x: shapeModel.coordinates.bottomLeading.x + cos(shapeModel.angleValues.bottomLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomLeading,
            y: shapeModel.coordinates.bottomLeading.y - sin(shapeModel.angleValues.bottomLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomLeading
        )
//
        let bottomLeadingCurveEnd = CGPoint(
            x: shapeModel.coordinates.bottomLeading.x + cos(shapeModel.angleValues.bottomLeadingAngleValues.endAngle.radians) * shapeModel.cornerRadii.bottomLeading,
            y: shapeModel.coordinates.bottomLeading.y - sin(shapeModel.angleValues.bottomLeadingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.bottomLeading
        )
        
        let bottomTrailingCurveBegin = CGPoint(
            x: shapeModel.coordinates.bottomTrailing.x + cos(shapeModel.angleValues.bottomTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomTrailing,
            y: shapeModel.coordinates.bottomTrailing.y - sin(shapeModel.angleValues.bottomTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomTrailing
        )

        let bottomTrailingCurveEnd = CGPoint(
            x: shapeModel.coordinates.bottomTrailing.x + cos(shapeModel.angleValues.bottomTrailingAngleValues.endAngle.radians) * shapeModel.cornerRadii.bottomTrailing,
            y: shapeModel.coordinates.bottomTrailing.y - sin(shapeModel.angleValues.bottomTrailingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.bottomTrailing
        )
        
        let topTrailingCurveBegin = CGPoint(
            x: shapeModel.coordinates.topTrailing.x + cos(shapeModel.angleValues.topTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topTrailing,
            y: shapeModel.coordinates.topTrailing.y - sin(shapeModel.angleValues.topTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topTrailing
        )
//
        let topTrailingCurveEnd = CGPoint(
            x: shapeModel.coordinates.topTrailing.x + cos(shapeModel.angleValues.topTrailingAngleValues.endAngle.radians) * shapeModel.cornerRadii.topTrailing,
            y: shapeModel.coordinates.topTrailing.y - sin(shapeModel.angleValues.topTrailingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.topTrailing
        )
        
        
        var path = Path()
        
        path.move(to: topLeadingCurveBegin)
        path.addLine(to: topLeadingCurveEnd)
        
        path.addLine(to: bottomLeadingCurveBegin)
        path.addLine(to: bottomLeadingCurveEnd)
        
        
        path.addLine(to: bottomTrailingCurveBegin)
        path.addLine(to: bottomTrailingCurveEnd)
        
        path.addLine(to: topTrailingCurveBegin)
        path.addLine(to: topTrailingCurveEnd)
        
        path.closeSubpath()
        return path
        
    }
    
    
    
    
    
}
//
//path.addArc(
//    center: CGPoint(x: rect.minX, y: rect.minY + 3.2),
//    radius: 0,
//    startAngle: Angle(degrees: 50),
//    endAngle: Angle(degrees: 50),
//    clockwise: false)
//
//path.addArc(
//    center: CGPoint(x: rect.maxX - 9.6, y: rect.minY + 17.6),
//    radius: 6.4,
//    startAngle: Angle(degrees: 300),
//    endAngle: Angle(degrees: 360),
//    clockwise: false)
//
//path.addArc(
//    center: CGPoint(x: rect.midX, y: rect.maxY - 25.6),
//    radius: 15.2,
//    startAngle: Angle(degrees: 0),
//    endAngle: Angle(degrees: 80),
//    clockwise: false
//)
//
//path.addArc(
//    center: CGPoint(x: rect.minX, y: rect.maxY - 7.2),
//    radius: 0,
//    startAngle: Angle(degrees: 0),
//    endAngle: Angle(degrees: 80),
//    clockwise: false
//)


struct TesteNewMorphingShape: View {
    
    @State var isTapped: Bool = false
    
    let shapeModel: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 0.32, y: 0.22),
            topTrailing: .init(x: 0.0, y: 0.04),
            bottomLeading: .init(x: 0.5, y: -0.3),
            bottomTrailing: .init(x: 0.0, y: -0.09)
        ),
        cornerRadii: .init(
            topLeading: 0.22,
            bottomLeading: 0.5,
            bottomTrailing: 0.0,
            topTrailing: 0.0
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180)))
        
    )
    
    let shapeModel2: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 9.5, y: 18.04),
            topTrailing: .init(x: 29.6, y: 3.28),
            bottomLeading: .init(x: 14.83, y: 57.4),
            bottomTrailing: .init(x: 29.6, y: 74.62)
        ),
        cornerRadii: .init(
            topLeading: 6.52,
            bottomLeading: 14.8,
            bottomTrailing: 0,
            topTrailing: 0
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 120), endAngle: Angle(degrees: 180)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 269)))
        
    )
    
    let shapeModel3: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 0, y: 0),
            topTrailing: .init(x: 29.6, y: 0),
            bottomLeading: .init(x: 0, y: 82.0),
            bottomTrailing: .init(x: 29.6, y: 82.0)
        ),
        cornerRadii: .init(
            topLeading: 0,
            bottomLeading: 0,
            bottomTrailing: 0,
            topTrailing: 0
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)))
        
    )
    
    
    
    let zeroModel: AnimatableShapeModel = .zero
    let zeroModel2: AnimatableShapeModel2 = .zero
    
    var currentShapeModel: AnimatableShapeModel {
        !isTapped ? shapeModel : zeroModel
    }
    
    var currentShapeModel2: AnimatableShapeModel {
        !isTapped ? shapeModel2 : shapeModel3
    }
    
    var body: some View {
        
        
            VStack {
                HStack {
                    GenericShape(shapeModel: currentShapeModel)
                        .frame(width: 29.6, height: 82.0)
                        .background(.indigo)

                    
                    TesteNewShape(shapeModel: currentShapeModel2)
                        .frame(width: 29.6, height: 82.0)
                        .background(.indigo)

                }
                .scaleEffect(3)
                .frame(width: 250, height: 280)
                .background(.red)
                
                Button {
                    withAnimation(.bouncy) {
                        isTapped.toggle()
                    }
                } label: {
                    Text("Teste")
                }
            
            
            
        }
        
        
    }
}








extension AnimatableShapeModel2: Animatable {
    var animatableData:AnimatablePair
        <
            AnimatableShapePropotionalCoordinates.AnimatableData,
            RectangleCornerRadii.AnimatableData
        >
    {
        get {
            
                AnimatablePair(
                    coordinates.animatableData,
                    cornerRadii.animatableData
                )
        }
        
        set {
            coordinates.animatableData = newValue.first
            cornerRadii.animatableData = newValue.second
        }
    }
    
    static let zero: AnimatableShapeModel2 = .init(coordinates: .zero, cornerRadii: .init(topLeading: .zero, bottomLeading: .zero, bottomTrailing: .zero, topTrailing: .zero))
}
