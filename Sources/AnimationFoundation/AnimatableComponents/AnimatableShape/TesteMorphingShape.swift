//
//  TesteMorphingShape.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//


import SwiftUI

struct TesteMorphingShape: View {
    
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
            topTrailingAngleValues: .init(startAngle: Angle(degrees: 50), endAngle: Angle(degrees: 50)),
            
            bottomTrailingAngleValues: .init(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 0)),
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180))), referenceSize: CGSize(width: 29.6, height: 82.0)
        
    )
    
    let zeroModel: AnimatableShapeModel = .zero
    
    var currentShapeModel: AnimatableShapeModel {
        !isTapped ? shapeModel : zeroModel
    }
    
    var body: some View {
        
        VStack {
            GenericShape(shapeModel: currentShapeModel)
            
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
