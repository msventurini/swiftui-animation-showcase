//
//  ShapeDataTesting.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//

import SwiftUI
import AnimationFoundation

struct GameBoyAdvanceShapeData {
    static let leftControllerShapeData: AnimatableShapeModel = .init(
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
            bottomLeadingAngleValues: .init(startAngle: Angle(degrees: 100), endAngle: Angle(degrees: 180))))
}


struct ShapeDataTesting: View {
    
    var body: some View {
        ArcCornersShape(shapeModel: GameBoyAdvanceShapeData.leftControllerShapeData)
            .frame(width: 29.6, height: 82.0)
            .background(.indigo)
    }
    
    
}

#Preview {
    ShapeDataTesting()
}
