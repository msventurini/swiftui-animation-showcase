//
//  BezierTest.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 05/06/25.
//

import SwiftUI

struct BezierTest: View {
    var body: some View {
        VStack {
            ZStack {
                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topTrailing: 200), style: .circular)
                    .fill(.cyan)
//                    .blendMode(.difference)

                BezierCubicCurveTestShape()
                    .fill(.red)
//                    .blendMode(.difference)
            }
//            .compositingGroup()
            
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 400)
            
        }
    }
}

struct BezierCubicCurveTestShape: Shape {
    
    let radius: Double = 200.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: rect.origin)
        
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
        
        path.addCurve(
            to: CGPoint(
                x: rect.maxX,
                y: rect.minY + radius
            ),
            control1: CGPoint(
                x: rect.maxX - radius * 0.5,
                y: rect.minY
            ),
            control2: CGPoint(
                x: rect.maxX,
                y: rect.minY + radius * 0.5
            )
        )
        
//        path.addCurve(
//            to: CGPoint(
//                x: rect.maxX,
//                y: rect.minY + radius
//            ),
//            control1: CGPoint(
//                x: rect.maxX - radius,
//                y: rect.minY
//            ),
//            control2: CGPoint(
//                x: rect.maxX,
//                y: rect.minY
//            )
//        )
        
                

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: rect.origin)
        return path
    }
    
    
}

struct BezierQuadCurveTestShape: Shape {
    
    let radius: Double = 200.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: rect.origin)
        
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
        
        
        
                path.addQuadCurve(
                    to: CGPoint(
                        x: rect.maxX,
                        y: rect.minY + radius
                    ),
                    control: CGPoint(
                        x: rect.maxX,
                        y: rect.minY
                    )
                )

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: rect.origin)
        return path
    }
    
    
}


#Preview {
    BezierTest()
}
