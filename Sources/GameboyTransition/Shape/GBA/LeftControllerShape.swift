//
//  LeftControllerShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI

enum ShapeData {
    
    case screenBody
    case leftController
    case rightController
    
    
    
}

struct PathArcData {
    
    
    
    
    
}


struct SectionShape: Shape {
    
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        
        
        
        
        return path
        
        
    }
    
    
    
    
}


// 370 x 205
// 144 x 80

// 205 * 0.4 = 82
// 160 * 0.4 = 64
// 74 * 0.4 = 29.6
// 64 * 0.4 = 25.6
// 44 * 0.4 = 17.6
// 38 * 0.4 = 15.2
// 24 * 0.4 = 9.6
// 22 * 0.4 = 8.8
// 18 * 0.4 = 7.2
// 16 * 0.4 = 6.4
// 8  * 0.4 = 3.2

struct LeftControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(

            center: CGPoint(x: rect.minX + 9.6, y: rect.minY + 17.6),
            radius: 6.4,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 240),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.minY + 3.2),
            radius: 0,
            startAngle: Angle(degrees: 50),
            endAngle: Angle(degrees: 50),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.maxY - 7.2),
            radius: 0,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY - 25.6),
//            radius: 38,
            radius: 15.2,
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
            center: CGPoint(x: rect.minX, y: rect.minY + 8),
            radius: 0,
            startAngle: Angle(degrees: 50),
            endAngle: Angle(degrees: 50),
            clockwise: false)
        
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 24, y: rect.minY + 44),
            radius: 16,
            startAngle: Angle(degrees: 300),
            endAngle: Angle(degrees: 360),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY - 64),
            radius: 38,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 80),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.minX, y: rect.maxY - 18),
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

#Preview {
    HStack(spacing: 0) {
        LeftControllerShape()
            .fill(.indigo)
            .frame(width: 29.6)
            .onGeometryChange(for: CGSize.self) { geometry in
                return geometry.size
            } action: { newValue in
                print("left: \(newValue.width)x\(newValue.height)")
            }
        ScreenLeftBodyShape()
            .fill(.indigo)
            .frame(width: 88.8)
            .onGeometryChange(for: CGSize.self) { geometry in
                return geometry.size
            } action: { newValue in
                print("screen: \(newValue.width)x\(newValue.height)")
            }
        
        RightControllerShape()
            .fill(.indigo)
            .frame(width: 29.6)
            .onGeometryChange(for: CGSize.self) { geometry in
                return geometry.size
            } action: { newValue in
                print("right: \(newValue.width)x\(newValue.height)")
            }
        
    }
    .frame(height: 82)
    .background(.red)
    .onGeometryChange(for: CGSize.self) { geometry in
        return geometry.size
    } action: { newValue in
        print("total: \(newValue.width)x\(newValue.height)")
    }
    
    
    
}
