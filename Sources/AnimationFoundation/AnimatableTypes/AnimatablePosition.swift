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
        self.x = x
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
    
    
    public static func + (lhs: AnimatablePosition, rhs: AnimatablePosition) -> AnimatablePosition {
        let result = AnimatablePosition(
            x: (lhs.x + lhs.x),
            y: (lhs.y + rhs.y)
        )
        return result
    }
    
    public static func - (lhs: AnimatablePosition, rhs: AnimatablePosition) -> AnimatablePosition {
        let result = AnimatablePosition(
            x: (lhs.x - lhs.x),
            y: (lhs.y - rhs.y)
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
        return ((self.y * self.y) + (self.x * self.x))
    }
    
    
}

struct TestAnimatablePosition: Shape {
    
    
    
    var currentOrigin: AnimatablePosition = .zero
    
    var animatableData: AnimatablePosition {
        get { currentOrigin }
        set { currentOrigin = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: currentOrigin.cgPoint)
        
        path.addLine(to: .init(x: rect.maxX, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        
        return path

    }
    
}

#Preview {
    
    @Previewable @State var isTapped: Bool = false
    
    var originValue: AnimatablePosition {
        isTapped ? .init(x: 20, y: 20) : .init(x: 0, y: 0) //.init(x: 20, y: 20) : .init(x: 0, y: 0)
    }
    
    TestAnimatablePosition(currentOrigin: originValue)
        .frame(width: 300, height: 300)
        .onTapGesture {
            withAnimation {
                isTapped.toggle()
            }
        }
    
    
    
    
}
