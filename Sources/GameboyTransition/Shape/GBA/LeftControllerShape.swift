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




struct LeftControllerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.minX + 24, y: rect.minY + 44),
            radius: 16,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 240),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.minY + 8),
            radius: 0,
            startAngle: Angle(degrees: 50),
            endAngle: Angle(degrees: 50),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.maxY - 18),
            radius: 0,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY - 64),
            radius: 38,
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
            center: CGPoint(x: rect.minX + 16, y: 22),
            radius: 22,
            startAngle: Angle(degrees: 220),
            endAngle: Angle(degrees: 270),
            clockwise: false)
        
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 16, y: 22),
            radius: 22,
            startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 320),
            clockwise: false)
        
        path.addArc(
            center: CGPoint(x: rect.maxX - 72, y: rect.maxY - 160),
            radius: 160,
            startAngle: Angle(degrees: 60),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )
        
        path.addArc(
            center: CGPoint(x: rect.minX + 72, y: rect.maxY - 160),
            radius: 160,
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
            .frame(width: 74)
            .onGeometryChange(for: CGSize.self) { geometry in
                return geometry.size
            } action: { newValue in
                print("left: \(newValue.width)x\(newValue.height)")
            }
        ScreenLeftBodyShape()
            .fill(.indigo)
            .frame(width: 222)
            .onGeometryChange(for: CGSize.self) { geometry in
                return geometry.size
            } action: { newValue in
                print("screen: \(newValue.width)x\(newValue.height)")
            }
        
        RightControllerShape()
            .fill(.indigo)
            .frame(width: 74)
            .onGeometryChange(for: CGSize.self) { geometry in
                return geometry.size
            } action: { newValue in
                print("right: \(newValue.width)x\(newValue.height)")
            }
        
    }
    .frame(height: 213)
    
    
    
}
