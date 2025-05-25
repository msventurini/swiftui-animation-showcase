//
//  Gameboy.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 23/05/25.
//


import SwiftUI
import Observation



public struct BodyColor: Animatable {
    
    
    
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

extension BodyColor: BitwiseCopyable {
    
}

extension BodyColor: Copyable {
    
}

extension BodyColor: Equatable {
    
}

extension BodyColor: Sendable {
    
}

extension BodyColor : AdditiveArithmetic {
    public static func - (lhs: BodyColor, rhs: BodyColor) -> BodyColor {
        let result = lhs.animatableData - rhs.animatableData
        return .init(red: result.first.first, green: result.first.second, blue: result.second.first, opacity: result.second.second)
    }
    
    public static func + (lhs: BodyColor, rhs: BodyColor) -> BodyColor {
        let result = lhs.animatableData + rhs.animatableData
        return .init(red: result.first.first, green: result.first.second, blue: result.second.first, opacity: result.second.second)
    }
    
    public static let zero: BodyColor = .init(red: 0, green: 0, blue: 0, opacity: 0)
    
}

public struct Gameboy  {
    
    let model: GameboyModel
    let screenBezelSize: CGSize
    let bodySize: CGSize
    let bodyColor: BodyColor
    let halfSize: CGSize
    let origin: CGPoint
    
    
    
    
    private init(
        model: GameboyModel,
        screenBezelSize: CGSize,
        bodySize: CGSize,
        bodyColor: BodyColor,
        origin: CGPoint
    ) {
        self.model = model
        self.screenBezelSize = screenBezelSize
        self.bodySize = bodySize
        self.bodyColor = bodyColor
        self.halfSize = CGSize(width: bodySize.width * 0.5, height: bodySize.height * 0.5)
        self.origin = origin
    }
    
    @MainActor public static let dmg: Gameboy = .init(
        model: .gameboyDMG,
        screenBezelSize: CGSize(width: 70, height: 54),
        bodySize: CGSize(width: 90, height: 148),
        bodyColor: .init(red: 190/255, green: 190/255, blue: 190/255),
        origin: .init(x: 42.5, y: 13.5)
    )//94 92 230
    
    @MainActor public static let advance: Gameboy = .init(
        model: .gameboyAdvance,
        screenBezelSize: CGSize(width: 70, height: 60),
        bodySize: CGSize(width: 144, height: 82),
        bodyColor: .init(red: 94/255, green: 92/255, blue: 230/255),
        origin: .init(x: 15.5, y: 46.5)
        
    )
    
    var offSetpadding: Double {
        
        switch model {
        case .gameboyDMG:
            -50
        case .gameboyAdvance:
            3
        }
        
    }
    
    
    
    @MainActor public func toggled() -> Gameboy {
        
        switch model {
        case .gameboyDMG:
            return Gameboy.advance
        case .gameboyAdvance:
            return Gameboy.dmg
        }
        
    }
    
    public func centerPoint(for size: CGSize) -> CGPoint {
        return CGPoint(x: size.width - (self.bodySize.width * 0.5), y: size.height - (self.bodySize.height * 0.5))
    }
    
    public enum GameboyModel: Sendable {
        case gameboyDMG
        case gameboyAdvance
    }
}
