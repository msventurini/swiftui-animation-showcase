//
//  ShapeWithArcCorners.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//


import SwiftUI

public struct ArcCornersShapeV2: Shape {
    
    public var shapeModel: AnimatableShapeModel
    
    public init(shapeModel: AnimatableShapeModel) {
        self.shapeModel = shapeModel
    }
    
    public func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        let topLeadingCurveBegin = MathUtils
            .cgPointRelativeToArc(
                located: .beforeCurve,
                atCoordinates: shapeModel.coordinates.topLeading,
                withRadius: shapeModel.cornerRadii.topLeading,
                withAngles: shapeModel.angleValues.topLeadingAngleValues)
        
        path.move(to: topLeadingCurveBegin)
        
        shapeModel
            .allVertices(in: rect)
            .forEach { vertex in
                
                    path.addRelativeArc(
                        center: vertex.coordinates,
                        radius: vertex.cornerRadius,
                        startAngle: vertex.angleValues.startAngle,
                        delta: vertex.angleValues.delta)
                    print(vertex.cornerRadius)
                
            }
        
        path.closeSubpath()
        return path
    }
}

public struct ArcCornersShape: Shape {
    
    public var shapeModel: AnimatableShapeModel
    
    public init(shapeModel: AnimatableShapeModel) {
        self.shapeModel = shapeModel
    }
    
    public func path(in rect: CGRect) -> Path {
        
        var shapePath = Path()
        
        var shapeRect = CGRect(
            origin: rect.origin,
            size: CGSize(width: 29.6, height: 82.0))
        
        let topLeadingCurveBegin = MathUtils
            .cgPointRelativeToArc(
                located: .beforeCurve,
                atCoordinates: shapeModel.coordinates.topLeading,
                withRadius: shapeModel.cornerRadii.topLeading,
                withAngles: shapeModel.angleValues.topLeadingAngleValues)
        
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
        
        
        
        
//        return path
        return shapePath
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
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 40)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180)))
        
    )
    
    let shapeModel4: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 0, y: 0),
            topTrailing: .init(x: 0, y: 0),
            bottomLeading: .init(x: 0, y: 0),
            bottomTrailing: .init(x: 0, y: 0)
        ),
        
        cornerRadii: .init(
            topLeading: 0,
            bottomLeading: 0,
            bottomTrailing: 0,
            topTrailing: 0
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 10), endAngle: Angle(degrees: 40)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180)))
    )
    
    let zeroModel: AnimatableShapeModel = .zero
    let zeroModel2: AnimatableShapeModel = .zero
    let zeroModel3: AnimatableShapeModel = .zero
    
    var currentShapeModel: AnimatableShapeModel {
        !isTapped ? shapeModel : zeroModel
    }
    
    var currentShapeModel2: AnimatableShapeModel {
        !isTapped ? shapeModel2 : shapeModel4
    }
    
    var currentShapeModel3: AnimatableShapeModel {
        !isTapped ? shapeModel3 : shapeModel4
    }
    
    var body: some View {
        
        
        VStack {
            HStack {
                GenericShape(shapeModel: currentShapeModel)
//                    .frame(width: 29.6, height: 82.0)
                    .background(.indigo)
                
                
                SquaredCornersShape(shapeModel: currentShapeModel2)
//                    .frame(width: 29.6, height: 82.0)
                    .background(.indigo)
                
                ArcCornersShape(shapeModel: currentShapeModel3)
//                    .frame(width: 29.6, height: 82.0)
                    .background(.indigo)
                
            }
//            .scaleEffect(3)
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
