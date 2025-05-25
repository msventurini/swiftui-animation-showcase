//
//  ConsoleFrame.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//

import SwiftUI

public struct AnimatableSize {
    
    public var width: Double
    public var height: Double
    
    public init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    public init(size: AnimatableSize) {
        self.width = size.width
        self.height = size.height
    }
    
    public init(size: CGSize) {
        self.width = size.width
        self.height = size.height
    }
    
}

extension AnimatableSize: BitwiseCopyable {
    
}

extension AnimatableSize: Copyable {
    
}

extension AnimatableSize: Equatable {
    
}

extension AnimatableSize: Sendable {
    
}

extension AnimatableSize: AdditiveArithmetic {
    
    public static func + (lhs: AnimatableSize, rhs: AnimatableSize) -> AnimatableSize {
        let result = AnimatableSize(
            width: lhs.width + rhs.width,
            height: lhs.height + rhs.height
        )
        return result
    }
    
    public static func - (lhs: AnimatableSize, rhs: AnimatableSize) -> AnimatableSize {
        let result = AnimatableSize(
            width: lhs.width - rhs.width,
            height: lhs.height - rhs.height
        )
        return result
    }
    
    
    
    private static func += (lhs: inout AnimatableSize, rhs: AnimatableSize) {
        lhs.width += rhs.width
        lhs.height += rhs.height
    }
    
    private static func -= (lhs: inout AnimatableSize, rhs: AnimatableSize) {
        lhs.width -= rhs.width
        lhs.height -= rhs.height
    }
    
    public static let zero: AnimatableSize = .init(width: 0, height: 0)
    
    
}

extension AnimatableSize: VectorArithmetic {
    mutating public func scale(by rhs: Double) {
        self.height = height * rhs
        self.width = width * rhs
    }
    
    public var magnitudeSquared: Double {
        return ((self.height * self.height) + (self.width * self.width))
    }
    
    
}
