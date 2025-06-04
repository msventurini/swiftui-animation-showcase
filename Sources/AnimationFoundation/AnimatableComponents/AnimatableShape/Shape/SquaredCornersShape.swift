//
//  TesteNewShape.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//


import SwiftUI

struct SquaredCornersShape: Shape {
    
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
        
//        MathUtils
//            .cgPointRelativeToArc(
//                located: AnimatableShapeModel.MathUtils.CurveRelativePosition.afterCurve,
//                atCoordinates: shapeModel.coordinates.topLeading
//            )
        
        let topLeadingCurveBegin = MathUtils.cgPointRelativeToArc(located: .beforeCurve, atCoordinates: shapeModel.coordinates.topLeading, withRadius: shapeModel.cornerRadii.topLeading, withAngles: shapeModel.angleValues.topLeadingAngleValues)
        
        let topLeadingCurveEnd = MathUtils.cgPointRelativeToArc(located: .afterCurve, atCoordinates: shapeModel.coordinates.topLeading, withRadius: shapeModel.cornerRadii.topLeading, withAngles: shapeModel.angleValues.topLeadingAngleValues)
        
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




struct SquaredCornersShapeDemo: View {
    
    @State var isTapped: Bool = false
    
    
    
    let shapeModel: AnimatableShapeModel = .init(
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
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 269))), referenceSize: CGSize(width: 29.6, height: 82.0)
        
    )
    
    
    let zeroModel: AnimatableShapeModel = .zero
    
    var currentShapeModel: AnimatableShapeModel {
        !isTapped ? shapeModel : zeroModel
    }
    var body: some View {
        
        VStack {
            SquaredCornersShape(shapeModel: currentShapeModel)
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
            Text("Toggle")
        }
        
        
        
    }
    
    
}

#Preview {
    SquaredCornersShapeDemo()
}
