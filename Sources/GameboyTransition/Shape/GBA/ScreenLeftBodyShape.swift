//
//  ScreenBodyShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI

struct ScreenLeftBodyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        path.addArc(
            center: CGPoint(x: rect.minX + 8, y: 22),
            radius: 22,
            startAngle: Angle(degrees: 210),
            endAngle: Angle(degrees: 270),
            clockwise: false)
        
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 8, y: 22),
            radius: 22,
            startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 330),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 72, y: rect.maxY - 160),
            radius: 160,
            startAngle: Angle(degrees: 30),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.minX + 72, y: rect.maxY - 160),
            radius: 160,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 150),
            clockwise: false
        )
        
        
        path.closeSubpath()
        return path
    }
    
}

#Preview {
    HStack(spacing: 80) {
        LeftControllerShape()
        
            .frame(width: 74)
        
        ScreenLeftBodyShape()
//            .frame(width: 111)
        
//        ScreenRightBodyShape()
            .frame(width: 222)
        
        RightControllerShape()
            .frame(width: 74)
    }
    .frame(height: 213)
    
    
    
}
