//
//  BodyColor.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation


public struct AnimatableColor: Animatable, Codable {
    
    var redComponent: CGFloat
    var greenComponent: CGFloat
    var blueComponent: CGFloat
    var opacityComponent: CGFloat
    
    public var animatableData:
        AnimatablePair< //Referente as cores
            AnimatablePair<CGFloat, CGFloat>,
            AnimatablePair<CGFloat, CGFloat>> {
            get {
                AnimatablePair(
                    AnimatablePair(redComponent,greenComponent),
                    AnimatablePair(blueComponent, opacityComponent),
                )
            }
            set {
                redComponent = newValue.first.first
                greenComponent = newValue.first.second
                blueComponent = newValue.second.first
                opacityComponent = newValue.second.second
            }
        }
    
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat = 1) {
        self.redComponent = red
        self.greenComponent = green
        self.blueComponent = blue
        self.opacityComponent = opacity
        
    }
    
    func asSwiftUIColor() -> Color {
        return Color(red: redComponent, green: greenComponent, blue: blueComponent, opacity: opacityComponent)
    }
}

extension AnimatableColor: BitwiseCopyable {
    
}

extension AnimatableColor: Copyable {
    
}

extension AnimatableColor: Equatable {
    
}

extension AnimatableColor: Sendable {
    
}

extension AnimatableColor : AdditiveArithmetic {
    public static func - (lhs: AnimatableColor, rhs: AnimatableColor) -> AnimatableColor {
        let result = lhs.animatableData - rhs.animatableData
        return .init(red: result.first.first, green: result.first.second, blue: result.second.first, opacity: result.second.second)
    }
    
    public static func + (lhs: AnimatableColor, rhs: AnimatableColor) -> AnimatableColor {
        let result = lhs.animatableData + rhs.animatableData
        return .init(red: result.first.first, green: result.first.second, blue: result.second.first, opacity: result.second.second)
    }
    
    public static let zero: AnimatableColor = .init(red: 0, green: 0, blue: 0, opacity: 0)
    
}
