//
//  BezierCornersShape.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 05/06/25.
//

import SwiftUI



public struct BezierCornersShape: Shape {
    
    public var shapeModel: AnimatableShapeModel
    
    public init(shapeModel: AnimatableShapeModel) {
        self.shapeModel = shapeModel
    }
    
    public func path(in rect: CGRect) -> Path {
        
        var shapePath = Path()
        
        let shapeRect = CGRect(origin: rect.origin, size: shapeModel.geometryValues.referenceSize)
        
        
        
        let topLeadingCurveBegin = MathUtils
            .cgPointRelativeToArc(
                located: .beforeCurve,
                atCoordinates: shapeModel.coordinates.topLeading,
                withRadius: shapeModel.cornerRadii.topLeading,
                withAngles: shapeModel.angleValues.topLeading)
        
        shapePath.move(to: topLeadingCurveBegin)
        
        shapeModel
            .allVertices(in: shapeRect)
            .forEach { vertex in
                
                shapePath.addRelativeArc(
                        center: vertex.coordinates,
                        radius: vertex.cornerRadius,
                        startAngle: vertex.angleValues.startAngle,
                        delta: vertex.angleValues.delta)
                    print(vertex.cornerRadius)
                
            }
        
        shapePath.closeSubpath()
        
        shapePath = shapePath.applying(.init(scaleX: shapeModel.geometryValues.horizontalScale, y: 1))
        
        let widthProportion = rect.width / shapeRect.width
        let heightProportion = rect.height / shapeRect.height
        
        let factor = 0 - (shapeModel.geometryValues.horizontalScale - 1) * 0.5
        
        let path = shapePath
            .applying(.init(
                scaleX: widthProportion,
                y: heightProportion))
            .offsetBy(dx:rect.width * factor, dy: 0)
            
                
        return path

    }
}

extension BezierCornersShape: Animatable {
    public var animatableData: AnimatableShapeModel.AnimatableData {
        
        get {
            shapeModel.animatableData
        }
        
        set {
            shapeModel.animatableData = newValue
        }
    }
}

struct TesteBezierCornersShape: View {
    
    @State var isTapped: Bool = false
    
   
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
    
    let shapeModelRounded: AnimatableShapeModel = .init(
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
            topLeading: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
            topTrailing: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            bottomTrailing: .init(startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 40)),
            bottomLeading: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180))),
        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 29.6, height: 82.0), horizontalScale: 1)
        
    )
    
    
    
    
    var squaredToRoundedShape: AnimatableShapeModel {
        isTapped ? shapeModelRounded : leftControllerShapeData
    }
    
    var normalToFlipped: AnimatableShapeModel {
        !isTapped ? shapeModelRounded : leftControllerShapeData
    }
    
    var body: some View {
        
        
        VStack {
            HStack {
                
                BezierCornersShape(shapeModel: squaredToRoundedShape)
                    .frame(width: 29.6, height: 82.0)
                    .background(.indigo)
                BezierCornersShape(shapeModel: normalToFlipped)
                    .frame(width: 29.6, height: 82.0)
                    .background(.indigo)
                
            }
            .scaleEffect(3)
            .frame(width: 350, height: 280)
            .background(.red)
            
            Button {
                withAnimation(.linear) {
                    isTapped.toggle()
                }
            } label: {
                Text("Teste")
            }
            
            
            
        }
        
        
    }
}

#Preview {
    TesteBezierCornersShape()
}





//var lastVertexPoint: CGPoint = topLeadingCurveBegin
//
//shapeModel
//    .allVertices(in: shapeRect)
//    .forEach { vertex in
//        
////                let horizontalDelta = abs(vertex.coordinates.x - )
//        
//        let controlPoint = CGPoint(
//            x: (lastVertexPoint.x + vertex.coordinates.x) * 0.5,
//            y: (lastVertexPoint.y + vertex.coordinates.y) * 0.5
//        )
//        
////                shapePath.addQuadCurve(to: vertex.coordinates, control: controlPoint)
////
//        
//        shapePath.addCurve(to: vertex.coordinates, control1: lastVertexPoint, control2: vertex.coordinates)
//        lastVertexPoint = vertex.coordinates
//        
//        shapePath.addRelativeArc(
