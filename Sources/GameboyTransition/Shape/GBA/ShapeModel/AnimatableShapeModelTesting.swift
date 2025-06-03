//
//  AnimatableShapeModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

#Preview {
    TesteNewMorphingShape()
}

struct ShapeWithArcCorners: Shape {
    
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
       
        var path = Path()
        let topLeadingCurveBegin = CGPoint(
            x: shapeModel.coordinates.topLeading.x + cos(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading,
            y: shapeModel.coordinates.topLeading.y - sin(shapeModel.angleValues.topLeadingAngleValues.startAngle.radians) * shapeModel.cornerRadii.topLeading
        )
        
        
        
        path.move(to: topLeadingCurveBegin)
 
        path.addRelativeArc(
            center: shapeModel.coordinates.topLeading,
            radius: shapeModel.cornerRadii.topLeading,
            startAngle: shapeModel.angleValues.topLeadingAngleValues.startAngle,
            delta: shapeModel.angleValues.topLeadingAngleValues.endAngle)
        
        
        path.addRelativeArc(
            center: shapeModel.coordinates.topTrailing,
            radius: shapeModel.cornerRadii.topTrailing,
            startAngle: shapeModel.angleValues.topTrailingAngleValues.startAngle,
            delta: shapeModel.angleValues.topTrailingAngleValues.endAngle)
        
        path.addRelativeArc(
            center: shapeModel.coordinates.bottomTrailing,
            radius: shapeModel.cornerRadii.bottomTrailing,
            startAngle: shapeModel.angleValues.bottomTrailingAngleValues.startAngle,
            delta: shapeModel.angleValues.bottomTrailingAngleValues.endAngle)
        
        
        path.addRelativeArc(
            center: shapeModel.coordinates.bottomLeading,
            radius: shapeModel.cornerRadii.bottomLeading,
            startAngle: shapeModel.angleValues.bottomLeadingAngleValues.startAngle,
            delta: shapeModel.angleValues.bottomLeadingAngleValues.endAngle)
        

        //
        path.closeSubpath()
        return path
        
    }
    
    
    
    
    
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
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 60)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 90)))
        //            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 269)))
        
    )
    
    let shapeModel4: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 0, y: 0),
            topTrailing: .init(x: 29.6, y: 0),
            bottomLeading: .init(x: 0, y: 82.0),
            bottomTrailing: .init(x: 29.6, y: 82.0)
        ),
        
        //            .frame(width: 29.6, height: 82.0)
        
        cornerRadii: .init(
            topLeading: 0,
            bottomLeading: 0,
            bottomTrailing: 0,
            topTrailing: 0
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 60)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 90)))
        
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
                    .frame(width: 29.6, height: 82.0)
                    .background(.indigo)
                
                
                ShapeWithSquaredCorners(shapeModel: currentShapeModel2)
                    .frame(width: 29.6, height: 82.0)
                    .background(.indigo)
                
                ShapeWithArcCorners(shapeModel: currentShapeModel3)
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
