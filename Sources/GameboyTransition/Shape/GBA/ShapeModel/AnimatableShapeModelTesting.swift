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

//struct LeftControllerShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        
//        path.addArc(
//            
//            center: CGPoint(
//                x: (rect.minX + rect.size.width * 0.32),
//                y: (rect.minY + rect.size.height * 0.22)
//            ),
//            
//            radius: rect.size.width * 0.22,
//            startAngle: Angle(degrees: 180),
//            endAngle: Angle(degrees: 240),
//            clockwise: false)
//        
//        path.addArc(
//            center: CGPoint(x: rect.maxX, y: rect.minY + (rect.size.height * 0.04)),
//            radius: 0,
//            startAngle: Angle(degrees: 50),
//            endAngle: Angle(degrees: 50),
//            clockwise: false)
//        
//        path.addArc(
//            center: CGPoint(x: rect.maxX, y: rect.maxY - (rect.size.height * 0.09)),
//            radius: 0,
//            startAngle: Angle(degrees: 0),
//            endAngle: Angle(degrees: 0),
//            clockwise: false
//        )
//        
//        path.addArc(
//            center: CGPoint(x: rect.midX, y: rect.maxY - (0.30 * rect.size.height)),
//            radius: rect.size.width * 0.5,
//            startAngle: Angle(degrees: 100),
//            endAngle: Angle(degrees: 180),
//            clockwise: false
//        )
//        
//        path.closeSubpath()
//        return path
//    }
//}



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
//    
        let topLeadingRadius = shapeModel.cornerRadii.topLeading

        let topTrailingRadius = shapeModel.cornerRadii.topTrailing
        
        let bottomTrailingRadius = shapeModel.cornerRadii.bottomTrailing
        
        let bottomLeadingRadius = shapeModel.cornerRadii.bottomLeading
        
//
//        
        var path = Path()
//        
        
        
        
        
//        let topLeadingCenter = CGPoint(
//            x: shapeModel.coordinates.topLeading.x,
//            y: shapeModel.coordinates.topLeading.y
//        )
        
        
        
        
//        let topTrailingCenter = CGPoint(
//            x: shapeModel.coordinates.topTrailing.x,
//            y: shapeModel.coordinates.topTrailing.y
//        )
//        
//        let bottomTrailingCenter = CGPoint(
//            x: shapeModel.coordinates.bottomTrailing.x,
//            y: shapeModel.coordinates.bottomTrailing.y
//        )
//        
//        let bottomLeadingCenter = CGPoint(
//            x: shapeModel.coordinates.bottomLeading.x,
//            y: shapeModel.coordinates.bottomLeading.y
//        )
//
        let teste = shapeModel.angleValues.topLeadingAngleValues.endAngle.radians - shapeModel.angleValues.topLeadingAngleValues.startAngle.radians
        let topLeadingCurveBegin = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(teste) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(teste) * shapeModel.cornerRadii.topLeading
        )
//
        let topLeadingCurveEnd = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.endAngle.radians) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.topLeading
        )
        
        let bottomLeadingCurveBegin = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(teste) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(teste) * shapeModel.cornerRadii.topLeading
        )
//
        let bottomLeadingCurveEnd = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.endAngle.radians) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.endAngle.radians)  * shapeModel.cornerRadii.topLeading
        )
        
        
        
//
//        let topTrailingCurveBegin = CGPoint(
//            x: (shapeModel.coordinates.topTrailing.x + cos(shapeModel.angleValues.topTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topTrailing),
//            y: shapeModel.coordinates.topTrailing.y + sin(shapeModel.angleValues.topTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topTrailing
//        )
////        
//        let topTrailingCurveEnd = CGPoint(
//            x: shapeModel.coordinates.topTrailing.x + cos(shapeModel.angleValues.topTrailingAngleValues.endAngle.radians) * shapeModel.cornerRadii.topTrailing,
//            y: shapeModel.coordinates.topTrailing.y + sin(shapeModel.angleValues.topTrailingAngleValues.endAngle.radians) * shapeModel.cornerRadii.topTrailing
//        )
//        
//        
//        let bottomTrailingCurveBegin = CGPoint(
//            x: shapeModel.coordinates.bottomTrailing.x +
//            cos(shapeModel.angleValues.bottomTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomTrailing,
//            y: shapeModel.coordinates.bottomTrailing.y + sin(shapeModel.angleValues.bottomTrailingAngleValues.startAngle.radians) * shapeModel.cornerRadii.bottomTrailing
//        )
//        
//        let bottomTrailingCurveEnd = CGPoint(
//            x: shapeModel.coordinates.bottomTrailing.x + cos(shapeModel.angleValues.bottomTrailingAngleValues.endAngle.radians) * shapeModel.cornerRadii.bottomTrailing,
//            y: shapeModel.coordinates.topTrailing.y + sin(shapeModel.angleValues.bottomTrailingAngleValues.endAngle.radians) * shapeModel.cornerRadii.bottomTrailing
//        )
//        
        
        
        
        
        
//        let leadingEdgeBottomPosition = CGPoint(x: rect.minX, y: rect.maxY - bottomLeadingRadius)
//
//        let leadingEdgeTopPosition = CGPoint(x: rect.minX, y: rect.minY + topLeadingRadius)
//        
//        let topEdgeLeadingPosition = CGPoint(x: rect.minX + topLeadingRadius, y: rect.minY)
//        
//        let topEdgeTrailingPosition = CGPoint(x: rect.maxX - topTrailingRadius, y: rect.minY)
//        
//        let trailingEdgeTopPosition = CGPoint(x: rect.maxX, y: rect.minY + topTrailingRadius)
//        
//        let trailingEdgeBottomPosition = CGPoint(x: rect.maxX, y: rect.maxY - bottomTrailingRadius)
//        
//        let bottomEdgeTrailingPosition = CGPoint(x: rect.maxX - bottomTrailingRadius, y: rect.maxY)
//        
//        let bottomEdgeLeadingPosition = CGPoint(x: rect.minX + bottomLeadingRadius, y: rect.maxY)
//        
//        
//        
        
        
        path.move(to: topLeadingCurveBegin)
        //curvehere
        path.addLine(to: topLeadingCurveEnd)
//        
//        path.addLine(to: topTrailingCurveBegin)
//        path.addLine(to: topTrailingCurveEnd)
//////        
//        path.addLine(to: bottomTrailingCurveBegin)
//        path.addLine(to: bottomTrailingCurveEnd)
//        
//        
        
//        path.addLine(to: topLeadingCurveBegin)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        

        
        
        
        
        
        

//
//        path.move(to: leadingEdgeBottomPosition)
//
//        path.addLine(to: leadingEdgeTopPosition)
//        //TopLeadingCurve
//        path.addLine(to: topEdgeLeadingPosition)
//          
//        path.addLine(to: topEdgeTrailingPosition)
//        //TopTrailingCurve
//        path.addLine(to: trailingEdgeTopPosition)
//        
//        path.addLine(to: trailingEdgeBottomPosition)
//        //bottomTrailingCurve
//        path.addLine(to: bottomEdgeTrailingPosition)
//        
//        path.addLine(to: bottomEdgeLeadingPosition)
//        //bottomLeadingCurve
//        path.addLine(to:  leadingEdgeBottomPosition)
        
        
//        
//
//        
//        return path
//        var path = Path()
        
        
        
        
//        path.addArc(
//            
//            center: CGPoint(
//                x: (rect.minX + rect.size.width * shapeModel.coordinates.topLeading.x),
//                y: (rect.minY + rect.size.height * shapeModel.coordinates.topLeading.y)
//            ),
//            
//            radius: rect.size.width * shapeModel.cornerRadii.topLeading,
//            startAngle: shapeModel.angleValues.topLeadingAngleValues.startAngle,
//            endAngle: shapeModel.angleValues.topLeadingAngleValues.endAngle,
//            clockwise: false)
//        
//        path.addArc(
//            center: CGPoint(
//                x: rect.maxX + rect.size.width * shapeModel.coordinates.topTrailing.x,
//                y: rect.minY + rect.size.height * shapeModel.coordinates.topTrailing.y),
//            radius: rect.size.width * shapeModel.cornerRadii.topTrailing,
//            startAngle: shapeModel.angleValues.topTrailingAngleValues.startAngle,
//            endAngle: shapeModel.angleValues.topTrailingAngleValues.endAngle,
//            clockwise: false)
////        
//        path.addArc(
//            center: CGPoint(
//                x: rect.maxX + rect.size.width * shapeModel.coordinates.bottomTrailing.x,
//                y: rect.maxY + rect.size.height * shapeModel.coordinates.bottomTrailing.y),
//            radius: rect.size.width * shapeModel.cornerRadii.bottomTrailing,
//            startAngle: shapeModel.angleValues.bottomTrailingAngleValues.startAngle,
//            endAngle: shapeModel.angleValues.bottomTrailingAngleValues.endAngle,
//            clockwise: false
//        )
//        
//        path.addArc(
//            center: CGPoint(x: rect.minX + rect.size.width * shapeModel.coordinates.bottomLeading.x, y: rect.maxY + rect.size.height * shapeModel.coordinates.bottomLeading.y),
//            radius: rect.size.width * shapeModel.cornerRadii.bottomLeading,
//            startAngle: shapeModel.angleValues.bottomLeadingAngleValues.startAngle,
//            endAngle: shapeModel.angleValues.bottomLeadingAngleValues.endAngle,
//            clockwise: false
//        )
        
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
            topLeading: .init(x: 9.43, y: 18.4),
            topTrailing: .init(x: 29.6, y: 3.28),
            bottomLeading: .init(x: 29.6, y: 74.62),
            bottomTrailing: .init(x: 14.83, y: 57.4)
        ),
        cornerRadii: .init(
            topLeading: 6.4,
            bottomLeading: 15.2,
            bottomTrailing: 6.4,
            topTrailing: 0
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180)))
        
    )
    
    
    
    let zeroModel: AnimatableShapeModel = .zero
    let zeroModel2: AnimatableShapeModel2 = .zero
    
    var currentShapeModel: AnimatableShapeModel {
        !isTapped ? shapeModel : zeroModel
    }
    
    var currentShapeModel2: AnimatableShapeModel {
        !isTapped ? shapeModel2 : zeroModel
    }
    
    var body: some View {
        
        
            VStack {
                HStack {
                    GenericShape(shapeModel: currentShapeModel)
                        .frame(width: 29.6, height: 82.0)
                    
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
                    Text("aaa")
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
