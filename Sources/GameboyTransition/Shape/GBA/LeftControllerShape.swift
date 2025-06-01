//
//  LeftControllerShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI





struct LeftControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height

        path.addArc(
            center: CGPoint(x: 24, y: 44),
            radius: 16,
            startAngle: Angle(degrees: 210),
            endAngle: Angle(degrees: 240),
            clockwise: false)
        
        

        //
        
        
//        path.addArc(
//            center: CGPoint(x: 8, y: 22),
//            radius: 16,
//            startAngle: Angle(degrees: 210),
//            endAngle: Angle(degrees: 270),
//            clockwise: false)
//        
//        
//        
        
        path.addArc(
            center: CGPoint(x: rect.midX + 8, y: 22),
            radius: 16,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 360),
            clockwise: false)
        
        

        //toptrailing

//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
//        path.addRelativeArc(
//            center: CGPoint(x: width, y: 8),
//            radius: 1,
//            startAngle: Angle(degrees: 0),
//            delta: Angle(degrees: 0)
//        )

        
        //bottomTrailing
        path.addRelativeArc(
            center: CGPoint(x: width, y: 196),
            radius: 1,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )

        //bottomTrailing
        path.addRelativeArc(
            center: CGPoint(x: rect.midX, y: 150),
            radius: 38,
            startAngle: Angle(degrees: 100),
            delta: Angle(degrees: 80)
        )
        
        path.closeSubpath()
        return path
    }
}

struct RightControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height

        let minX = rect.minX
        let minY = rect.minY
        
        let midX = rect.midX
        let midY = rect.midY
        
        let maxX = rect.maxX
        let maxY = rect.maxY
        
        
        //topleading
        path.addRelativeArc(
            center: CGPoint(x: minX, y: 0.04 * maxY),
            radius: 0,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )

        path.addRelativeArc(
            center: CGPoint(x: midX, y: minY),
            radius: 0.3 * maxX,
            startAngle: Angle(degrees: 120),
            delta: Angle(degrees: 0))
        
        //toptrailing
        path.addRelativeArc(
            center: (CGPoint(x: 0.70*maxX, y: 0.17*maxY)),
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
    HStack(spacing: 2) {
        LeftControllerShape()
        
            .frame(width: 74)
        
        ScreenLeftBodyShape()
            .frame(width: 111)
        
        ScreenRightBodyShape()
            .frame(width: 111)
        
        RightControllerShape()
            .frame(width: 74)
    }
    .frame(height: 213)
    
    
    
}
