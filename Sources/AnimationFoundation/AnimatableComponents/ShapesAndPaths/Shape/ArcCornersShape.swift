//
//  ShapeWithArcCorners.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//


import SwiftUI


public struct ArcCornersShape: Shape {
    
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

extension ArcCornersShape: Animatable {
    public var animatableData: AnimatableShapeModel.AnimatableData {
        
        get {
            shapeModel.animatableData
        }
        
        set {
            shapeModel.animatableData = newValue
        }
    }
}

struct TesteNewMorphingShape2: View {
    
    @State var isTapped: Bool = false
    
    

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
    
    let shapeModelRoundedReversedX: AnimatableShapeModel = .init(
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
        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 30, height: 82.0), horizontalScale: -1)
        
    )
    
    
    let shapeModelSquared: AnimatableShapeModel = .init(
        coordinates: .init(),
        cornerRadii: .init(),
        angleValues: .init(),
        geometryValues: .init(referenceSize: CGSize(width: 30, height: 82.0))
    )
    
    let shapeModelSquaredFlipped: AnimatableShapeModel = .init(
        coordinates: .init(),
        cornerRadii: .init(),
        angleValues: .init(),
        geometryValues: .init(referenceSize: CGSize(width: 30, height: 82.0), horizontalScale: -1)
    )
    
    
    
    var squaredToRoundedShape: AnimatableShapeModel {
        !isTapped ? shapeModelRounded : shapeModelSquared
    }
    
    var normalToFlipped: AnimatableShapeModel {
        !isTapped ? shapeModelRounded : shapeModelSquaredFlipped
    }
    
    var body: some View {
        
        
        VStack {
            HStack {
                
                ArcCornersShape(shapeModel: squaredToRoundedShape)
                    .frame(width: 29.6, height: 82.0)
                    .background(.indigo)
                ArcCornersShape(shapeModel: normalToFlipped)
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
    TesteNewMorphingShape2()
}
