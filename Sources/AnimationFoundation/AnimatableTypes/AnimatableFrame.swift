////
////  AnimatableFrame.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 25/05/25.
////
//
//import SwiftUI
//
//public struct AnimatableRect {
//    
//    public var position: AnimatablePosition
//    
//    public var size: AnimatableSize
//    
//    public var cgRect: CGRect {
//        return CGRect(origin: origin, size: size.cgSize)
//    }
//    
//    public var origin:  CGPoint {
//        return CGPoint(x: position.x + (size.width * 0.5), y: position.y - (size.height * 0.5))
//    }
//    
//    public init(x: Double, y: Double, width: Double, height: Double) {
//        self.position = .init(x: x, y: y)
//        self.size = .init(width: width, height: height)
//    }
//    
//    public init(position: AnimatablePosition, size: AnimatableSize) {
//        self.position = position
//        self.size = size
//    }
//    
//    public init(cgRect: CGRect) {
//        self.position = .init(cgPoint: cgRect.origin)
//        self.size = .init(size: cgRect.size)
//    }
//    
//    
//}
//
//extension AnimatableRect: BitwiseCopyable {
//    
//}
//
//extension AnimatableRect: Copyable {
//    
//}
//
//extension AnimatableRect: Equatable {
//    
//}
//
//extension AnimatableRect: Sendable {
//    
//}
//
//extension AnimatableRect: AdditiveArithmetic {
//    
//    public static func + (lhs: AnimatableRect, rhs: AnimatableRect) -> AnimatableRect {
//        let result = AnimatableRect(
//            position: (lhs.position + rhs.position),
//            size: (lhs.size + rhs.size),
//        )
//        return result
//    }
//    
//    public static func - (lhs: AnimatableRect, rhs: AnimatableRect) -> AnimatableRect {
//        let result = AnimatableRect(
//            position: (lhs.position - rhs.position),
//            size: (lhs.size - rhs.size),
//        )
//        return result
//    }
//    
//    
//    
//    private static func += (lhs: inout AnimatableRect, rhs: AnimatableRect) {
//        lhs.position += rhs.position
//        lhs.size += rhs.size
//    }
//    
//    private static func -= (lhs: inout AnimatableRect, rhs: AnimatableRect) {
//        lhs.position -= rhs.position
//        lhs.size -= rhs.size
//    }
//    
//    public static let zero: AnimatableRect = .init(position: .zero, size: .zero)
//    
//    
//}
//
//extension AnimatableRect: VectorArithmetic {
//    mutating public func scale(by rhs: Double) {
//        self.position = self.position.scaled(by: rhs)
//        self.size = self.size.scaled(by: rhs)
//    }
//    
////    private func deltaPosition(initialPosition: AnimatablePosition, positionVariation: AnimatableSize) -> AnimatableRect {
////        return AnimatableRect(position: <#T##AnimatablePosition#>, size: <#T##AnimatableSize#>)
////    }
//    
//    public var magnitudeSquared: Double {
////        return ((self.y * self.y) + (self.x * self.x))
////        return self.size.magnitudeSquared((self.y * self.y) + (self.x * self.x))
////        return CGRect(origin: self.position.cgPoint, size: self.size.cgSize).in
//        return self.size.magnitudeSquared + self.position.magnitudeSquared
//    }
//    
//    
//}
