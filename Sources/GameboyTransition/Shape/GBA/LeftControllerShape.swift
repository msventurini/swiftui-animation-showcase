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

        //topleading
        path.addRelativeArc(
            center: (CGPoint(x: 0.30*width, y: 0.17*height)),
            radius: 0.05 * height,
            startAngle: Angle(degrees: 180),
            delta: Angle(degrees: 90)
        )
        

        //topcenter
        
        path.addRelativeArc(
            center: CGPoint(x: 0.5*width, y: 0*height),
            radius: 0.3 * width,
            startAngle: Angle(degrees: 60),
            delta: Angle(degrees: 0))
        
        
        
        //toptrailing

        path.addRelativeArc(
//            center: CGPoint(x: 0.0*width, y: 0.04*height),
            center: CGPoint(x: width, y: 0.04*height),
            radius: 1,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )

        
        //bottomTrailing
        path.addRelativeArc(
            center: CGPoint(x: width, y: 0.92*height),
            radius: 1,
            startAngle: Angle(degrees: 0),
            delta: Angle(degrees: 0)
        )
        
        
        //bottomCenter
        path.addRelativeArc(
            center: CGPoint(x: 0.5*width, y: 0.88*height),
            radius: 1,
            startAngle: .zero,
            delta: .zero
        )
       
        //bottomTrailing
        path.addRelativeArc(
            center: CGPoint(x: 0.50*width, y: 0.7*height),
            radius: 0.175 * height,
            startAngle: Angle(degrees: 120),
            delta: Angle(degrees: 60)
        )
        
        path.closeSubpath()
        return path
    }
}
