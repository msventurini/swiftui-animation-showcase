//
//  AnimatableShapeModel+MathUtils.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//

import SwiftUI

enum ArcRelativePosition {
    case beforeCurve
    case afterCurve
}

struct MathUtils {
    
    static func cgPointRelativeToArc(located curve: ArcRelativePosition, atCoordinates coordinates: CGPoint, withRadius radius: CGFloat, withAngles angles: AnimatableAngleVariation) -> CGPoint {
        
        switch curve {
        case .beforeCurve:
            cgPointBeforeArc(atCoordinates: coordinates, withRadius: radius, withAngles: angles)
        case .afterCurve:
            cgPointAfterArc(atCoordinates: coordinates, withRadius: radius, withAngles: angles)
        }
    }
    
    private static func cgPointBeforeArc(atCoordinates coordinates: CGPoint, withRadius radius: CGFloat, withAngles angles: AnimatableAngleVariation) -> CGPoint {
        return CGPoint(
            x: coordinates.x + cos(angles.startAngle.radians) * radius,
            y: coordinates.y - sin(angles.startAngle.radians) * radius
        )
    }
    
    private static func cgPointAfterArc(atCoordinates coordinates: CGPoint, withRadius radius: CGFloat, withAngles angles: AnimatableAngleVariation) -> CGPoint {
        return CGPoint(
            x: coordinates.x + cos(angles.endAngle.radians) * radius,
            y: coordinates.y - sin(angles.endAngle.radians) * radius
        )
    }
    
}



