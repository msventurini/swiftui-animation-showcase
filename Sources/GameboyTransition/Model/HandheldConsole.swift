//
//  HandheldConsole.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation

public struct HandheldConsole  {
    
    let model: GameboyModel
    let screenBezelSize: CGSize
    let screenSize: CGSize
    let bodySize: AnimatableSize
    let bodyColor: BodyColor
    let halfSize: CGSize
    let numberOfButtons: Int
    
    
    private init(
        model: GameboyModel,
        screenBezelSize: CGSize,
        screenSize: CGSize,
        bodySize: AnimatableSize,
        bodyColor: BodyColor,
        numberOfButtons: Int
    ) {
        self.model = model
        self.screenBezelSize = screenBezelSize
        self.bodySize = bodySize
        self.bodyColor = bodyColor
        self.halfSize = CGSize(width: bodySize.width * 0.5, height: bodySize.height * 0.5)
        self.screenSize = screenSize
        self.numberOfButtons = numberOfButtons
    }
    
//        .frame(width: (isClicked ? 61 : 47), height: (isClicked ? 41 : 43))
//        .offset(y: (isClicked ? -2 : -25))
    
    
    @MainActor public static let dmg: HandheldConsole = .init(
        model: .gameboyDMG,
        screenBezelSize: CGSize(width: 70, height: 54), screenSize: .init(width: 47, height: 43),
        bodySize: .init(size: .init(width: 90, height: 148)),
        bodyColor: .init(red: 190/255, green: 190/255, blue: 190/255), numberOfButtons: 2,
        
    )//94 92 230
    
    @MainActor public static let advance: HandheldConsole = .init(
        model: .gameboyAdvance,
        screenBezelSize: CGSize(width: 70, height: 60), screenSize: .init(width: 61, height: 41),
        bodySize: .init(size: .init(width: 144, height: 82)),
        bodyColor: .init(red: 94/255, green: 92/255, blue: 230/255), numberOfButtons: 2,
    )
    
    @MainActor public static let nswitch: HandheldConsole = .init(
        model: .gameboyAdvance,
        screenBezelSize: CGSize(width: 70, height: 60), screenSize: .init(width: 61, height: 41),
        bodySize: .init(size: .init(width: 144, height: 82)),
        bodyColor: .init(red: 94/255, green: 92/255, blue: 230/255), numberOfButtons: 4,
    )
    
    var offSetpadding: Double {
        
        switch model {
        case .gameboyDMG:
            -25
        case .gameboyAdvance:
            1.5
        }
        
    }
    
    
    
    @MainActor public func toggled() -> HandheldConsole {
        
        switch model {
        case .gameboyDMG:
            return HandheldConsole.advance
        case .gameboyAdvance:
            return HandheldConsole.dmg
        }
        
    }
    
//    public func centerPoint(for size: CGSize) -> CGPoint {
//        return CGPoint(x: size.width - (self.bodyRect.size.width * 0.5), y: size.height - (self.bodyRect.size.height * 0.5))
//    }
    
    public enum GameboyModel: Sendable {
        case gameboyDMG
        case gameboyAdvance
    }
}