//
//  LeftControllerShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI

struct RightControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height

        
        
        //topleading
        path.addRelativeArc(
            center: CGPoint(x: 0.0*width, y: 0.04*height),
            radius: -1,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )

        path.addRelativeArc(
            center: CGPoint(x: 0.5*width, y: 0*height),
            radius: 0.3 * width,
            startAngle: Angle(degrees: 120),
            delta: Angle(degrees: 0))
        
        //toptrailing
        path.addRelativeArc(
            center: (CGPoint(x: 0.70*width, y: 0.17*height)),
            radius: 0.05 * height,
            startAngle: Angle(degrees: 270),
            delta: Angle(degrees: 90)
        )

        
        //bottomTrailing
        path.addRelativeArc(
            center: CGPoint(x: 0.50*width, y: 0.7*height),
            radius: 0.175 * height,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 60)
        )

        //bottomCenter
        path.addRelativeArc(
            center: CGPoint(x: 0.5*width, y: 0.88*height),
            radius: -1,
            startAngle: .zero,
            delta: .zero
        )

        //BottomLeading
        path.addRelativeArc(
            center: CGPoint(x: 0.0*width, y: 0.92*height),
            radius: -1,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )
        
        path.closeSubpath()
        return path
    }
}

#Preview {
    RightControllerShape()
        .frame(width: 74, height: 213)

}
