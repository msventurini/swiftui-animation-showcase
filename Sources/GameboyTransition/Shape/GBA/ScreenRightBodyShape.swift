//
//  ScreenRightBodyShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI

struct ScreenRightBodyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height

        //topleading

        path.addRelativeArc(
            center: (CGPoint(x: 0, y: 0)),
            radius: 0,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )
        
        
        //topcenter
        path.addRelativeArc(
            center: CGPoint(x: 0.7*width, y: 0.23*height),
            radius: 0.45 * width,
            startAngle: Angle(degrees: 270),
            delta: Angle(degrees: 30)
        )
        
        
    
        
        //toptrailing
        
        path.addRelativeArc(
            center: CGPoint(x: width, y: 0.04*height),
            radius: 0 * width,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )

        //bottomTrailing
        path.addRelativeArc(
            center: CGPoint(x: width, y: 0.92*height),
            radius: 0 * height,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )

        //bottomCenter
        path.addRelativeArc(
            center: CGPoint(x: 0.40*width, y: 0.5*height),
            radius: 0.95 * width,
            startAngle: Angle(degrees: 70),
            delta: Angle(degrees: 20)
        )

        //BottomLeading
        path.addRelativeArc(
            center: CGPoint(x: 0.0*width, y: height),
            radius: 0 * width,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )
        
        path.closeSubpath()
        return path
    }
}