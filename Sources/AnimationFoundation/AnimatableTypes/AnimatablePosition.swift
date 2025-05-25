//
//  AnimatablePosition.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//

import SwiftUI

public struct AnimatablePosition {
    
    public var x: Double
    
    public var y: Double
    
    public var cgPoint: CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    public init(x: Double, y: Double) {
        self.x = y
        self.y = y
    }
    
    public init(position: AnimatablePosition) {
        self.x = position.x
        self.y = position.y
    }
    
    public init(cgPoint: CGPoint) {
        self.x = cgPoint.x
        self.y = cgPoint.y
    }
}

extension AnimatablePosition: BitwiseCopyable {
    
}

extension AnimatablePosition: Copyable {
    
}

extension AnimatablePosition: Equatable {
    
}

extension AnimatablePosition: Sendable {
    
}

extension AnimatablePosition: AdditiveArithmetic {
    public static func - (lhs: AnimatablePosition, rhs: AnimatablePosition) -> AnimatablePosition {
        let result = AnimatablePosition(
            x: (lhs.x - lhs.x),
            y: (lhs.y - rhs.y)
        )
        return result
    }
    
    public static func + (lhs: AnimatablePosition, rhs: AnimatablePosition) -> AnimatablePosition {
        let result = AnimatablePosition(
            x: (lhs.x + lhs.x),
            y: (lhs.y + rhs.y)
        )
        return result
    }
    
    private static func += (lhs: inout AnimatablePosition, rhs: AnimatablePosition) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
    
    private static func -= (lhs: inout AnimatablePosition, rhs: AnimatablePosition) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
    
    public static let zero: AnimatablePosition = .init(x: 0, y: 0)
    
    
}

extension AnimatablePosition: VectorArithmetic {
    mutating public func scale(by rhs: Double) {
        self.x = x * rhs
        self.y = y * rhs
    }
    
    public var magnitudeSquared: Double {
        return ((self.y * self.y) + (self.x + self.x))
    }
    
    
}
