//
//  LeftControllerShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI
import AnimationFoundation




struct LeftControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        
        path.addArc(
            
            center: CGPoint(
                x: (rect.minX + rect.size.width * 0.32),
                y: (rect.minY + rect.size.height * 0.22)
            ),
            
            radius: rect.size.width * 0.22,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 240),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.minY + (rect.size.height * 0.04)),
            radius: 0,
            startAngle: Angle(degrees: 50),
            endAngle: Angle(degrees: 50),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.maxY - (rect.size.height * 0.09)),
            radius: 0,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY - (0.30 * rect.size.height)),
            radius: rect.size.width * 0.5,
            startAngle: Angle(degrees: 100),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )
        
        path.closeSubpath()
        return path
    }
}

struct RightControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.minY + 3.2),
            radius: 0,
            startAngle: Angle(degrees: 50),
            endAngle: Angle(degrees: 50),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 9.6, y: rect.minY + 17.6),
            radius: 6.4,
            startAngle: Angle(degrees: 300),
            endAngle: Angle(degrees: 360),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY - 25.6),
            radius: 15.2,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 80),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.maxY - 7.2),
            radius: 0,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 80),
            clockwise: false
        )
        
        
        
        
        
        
        path.closeSubpath()
        return path
    }
}

struct ScreenLeftBodyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.minX + 6.4, y: 8.8),
            radius: 8.8,
            startAngle: Angle(degrees: 220),
            endAngle: Angle(degrees: 270),
            clockwise: false)
        
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 6.4, y: 8.8),
            radius: 8.8,
            startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 320),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 28.8, y: rect.maxY - 64),
            radius: 64,
            startAngle: Angle(degrees: 60),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.minX + 28.8, y: rect.maxY - 64),
            radius: 64,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 120),
            clockwise: false
        )
        
        
        path.closeSubpath()
        return path
    }
    
}

//#Preview {
//    TesteMorphingShape()
//        .frame(width: 29.6 ,height: 82)
//
//}

#Preview {

        HStack(spacing: 0) {
            LeftControllerShape()
                .fill(.indigo)
                .frame(width: 29.6)

            ScreenLeftBodyShape()
                .fill(.indigo)
                .frame(width: 88.8)
    
            RightControllerShape()
                .fill(.indigo)
                .frame(width: 29.6)

        }
        .frame(height: 82)
        .background(.red)
}
