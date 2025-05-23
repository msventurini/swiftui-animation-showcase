//
//  Gameboy.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 23/05/25.
//


import SwiftUI
import Observation

public struct Gameboy : Sendable{
    //            dmg
    //
    //            gba
    //
    let model: GameboyModel
    let screenBezelSize: CGSize
    let bodySize: CGSize
    let bodyColor: BodyColor
    let halfSize: CGSize
    let origin: CGPoint
    
    
    public struct BodyColor: Sendable {
        let redComponent: CGFloat
        let greenComponent: CGFloat
        let blueComponent: CGFloat
        let opacityComponent: CGFloat
        
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
    
    public static let dmg: Gameboy = .init(
        model: .gameboyDMG,
        screenBezelSize: CGSize(width: 70, height: 54),
        bodySize: CGSize(width: 90, height: 148),
        bodyColor: .init(red: 190/255, green: 190/255, blue: 190/255),
        origin: .init(x: 42.5, y: 13.5)
    )//94 92 230
    
    public static let advance: Gameboy = .init(
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
    
    
    
    public func toggled() -> Gameboy {
        
        switch model {
        case .gameboyDMG:
            return Gameboy.advance
        case .gameboyAdvance:
            return Gameboy.dmg
        }
        
    }
    
    //    static func toggledValue(of model: GameboyModel) -> GameboyModel {
    //        switch model {
    //        case .gameboyDMG:
    //                .gameboyAdvance
    //        case .gameboyAdvance:
    //                .gameboyDMG
    //        }
    //    }
    
    public func centerPoint(for size: CGSize) -> CGPoint {
        return CGPoint(x: size.width - (self.bodySize.width * 0.5), y: size.height - (self.bodySize.height * 0.5))
    }
    
    public enum GameboyModel: Sendable {
        case gameboyDMG
        case gameboyAdvance
    }
}
