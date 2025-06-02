//
//  AnimatableShapeModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI


struct AnimatableShapeModel: Sendable, Animatable {
    
    enum AnimatableShapeModelVertex {
        case topLeading
        case topTrailing
        case bottomLeading
        case bottomTrailing
    }
    
    var coordinates: AnimatableShapeCoordinates
    var cornerRadii: RectangleCornerRadii
    var angleValues: AnimatableShapeAngleValues
    
    var animatableData: AnimatablePair<
        AnimatablePair<
            AnimatableShapeCoordinates.AnimatableData,
            RectangleCornerRadii.AnimatableData
        >,
        AnimatableShapeAngleValues.AnimatableData
    >
    {
        get {
            AnimatablePair(
                AnimatablePair(
                    coordinates.animatableData,
                    cornerRadii.animatableData
                ),
                angleValues.animatableData
            )
        }
        
        set {
            coordinates.animatableData = newValue.first.first
            cornerRadii.animatableData = newValue.first.second
            angleValues.animatableData = newValue.second
        }
    }
    
    public static let zero: AnimatableShapeModel = .init(
        coordinates: AnimatableShapeCoordinates.zero,
        cornerRadii: .init(
            topLeading: .zero,
            bottomLeading: .zero,
            bottomTrailing: .zero,
            topTrailing: .zero),
        angleValues: AnimatableShapeAngleValues.zero
    )
    
    func getCoordinatesfor(_ vertex: AnimatableShapeModelVertex) -> CGPoint {
        switch vertex {
        case .topLeading: self.coordinates.topLeading
        case .topTrailing: self.coordinates.topTrailing
        case .bottomLeading: self.coordinates.bottomLeading
        case .bottomTrailing: self.coordinates.bottomTrailing
        }
    }
    
    
    func getCornerRadiiFor(_ vertex: AnimatableShapeModelVertex) -> CGFloat {
        switch vertex {
        case .topLeading: self.cornerRadii.topLeading
        case .topTrailing: self.cornerRadii.topTrailing
        case .bottomLeading: self.cornerRadii.bottomLeading
        case .bottomTrailing: self.cornerRadii.bottomTrailing
        }
    }
        
        
    func getAngleValuesfor(_ vertex: AnimatableShapeModelVertex) -> AnimatableAngleVariation {
        switch vertex {
        case .topLeading: self.angleValues.topLeadingAngleValues
        case .topTrailing: self.angleValues.topTrailingAngleValues
        case .bottomLeading: self.angleValues.bottomTrailingAngleValues
        case .bottomTrailing: self.angleValues.bottomLeadingAngleValues
        }
    }
    
}


#Preview {
    TesteMorphingShape()
}



struct TesteMorphingShape: View {
    
    @State var isTapped: Bool = false
    
    let shapeModel: AnimatableShapeModel = .init(
        coordinates: .init(
            topLeading: .init(x: 5, y: 100),
            topTrailing: .init(x: 50, y: 150),
            bottomLeading: .init(x: 25, y: 670),
            bottomTrailing: .init(x: 90, y: 70)
        ),
        cornerRadii: .init(
            topLeading: 15,
            bottomLeading: 20,
            bottomTrailing: 30,
            topTrailing: 25
        ),
        angleValues: .init(
            topLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 240)),
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 50), endAngle: Angle(degrees: 50)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180)))
        
    )
    
    let zeroModel: AnimatableShapeModel = .zero
    
    var currentShapeModel: AnimatableShapeModel {
        isTapped ? shapeModel : zeroModel
    }
    
    var body: some View {
        
        VStack {
            GenericShape(shapeModel: currentShapeModel)
            
            Button {
                withAnimation(.linear) {
                    isTapped.toggle()
                }
            } label: {
                Text("aaa")
            }
            
        }
        
        
    }
}

struct GenericShape: Shape {
    
    var shapeModel: AnimatableShapeModel
    
    var animatableData: AnimatableShapeModel.AnimatableData {
        
        get {
            shapeModel.animatableData
        }
        
        set {
            shapeModel.animatableData = newValue
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(
                x: (shapeModel.coordinates.topLeading.x),
                y: (shapeModel.coordinates.topLeading.y)
            ),
            
            radius: shapeModel.cornerRadii.topLeading,
            startAngle: shapeModel.angleValues.topLeadingAngleValues.startAngle,
            endAngle: shapeModel.angleValues.topLeadingAngleValues.endAngle,
            clockwise: false)
        
        path.addArc(
            center: CGPoint(
                x: (shapeModel.coordinates.topTrailing.x),
                y: (shapeModel.coordinates.topTrailing.y)),
            radius: shapeModel.cornerRadii.topTrailing,
            startAngle: shapeModel.angleValues.topTrailingAngleValues.startAngle,
            endAngle: shapeModel.angleValues.topTrailingAngleValues.endAngle,
            clockwise: false)
        
        
        path.addArc(
            center: CGPoint(
                x: (shapeModel.coordinates.bottomTrailing.x),
                y: (shapeModel.coordinates.bottomTrailing.y)),
            radius: shapeModel.cornerRadii.bottomTrailing,
            startAngle: shapeModel.angleValues.bottomTrailingAngleValues.startAngle,
            endAngle: shapeModel.angleValues.bottomTrailingAngleValues.endAngle,
            clockwise: false
        )
        
        
        path.addArc(
            center: CGPoint(
                x: (shapeModel.coordinates.bottomLeading.x),
                y: (shapeModel.coordinates.bottomLeading.y)),
            radius: shapeModel.cornerRadii.bottomLeading,//radius.bottomLeading,
            startAngle: shapeModel.angleValues.bottomLeadingAngleValues.startAngle,
            endAngle: shapeModel.angleValues.bottomLeadingAngleValues.startAngle,
            clockwise: false
        )
        
        path.closeSubpath()
        return path
    }
}
