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
    
    let model: HandheldGameConsole
    
    let leftControls: ControllerConfiguration
    let rightControls: ControllerConfiguration
    
    private init(
        model: HandheldGameConsole,
        
        
        
        leftControls: ControllerConfiguration,
        rightControls: ControllerConfiguration
    ) {
        self.model = model
        
        
        
        
        self.leftControls = leftControls
        self.rightControls = rightControls
    }

    @MainActor public static let dmg: HandheldConsole = .init(
        model: .gameboyDMG,leftControls: .init(analogStickState: .analogStickDisabled, side: .left, numberOfButtons: 4), rightControls: .init(analogStickState: .analogStickDisabled, side: .right, numberOfButtons: 2))
    
    @MainActor public static let advance: HandheldConsole = .init(
        model: .gameboyAdvance, leftControls: .init(analogStickState: .analogStickDisabled, side: .left, numberOfButtons: 4), rightControls: .init(analogStickState: .analogStickDisabled, side: .right, numberOfButtons: 2))
//
    @MainActor public static let nswitch: HandheldConsole = .init(
        model: .nintendoSwitch, leftControls: .init(analogStickState: .analogStickEnabled, side: .left, numberOfButtons: 4), rightControls: .init(analogStickState: .analogStickEnabled, side: .right, numberOfButtons: 4))
    
    var offSetpadding: Double {
        switch model {
        case .gameboyDMG:
            -25
        case .gameboyAdvance:
            1.5
        default:
            0.0
        }
    }
    
    
    @MainActor public func toggled() -> HandheldConsole {
        
        switch model {
        case .gameboyDMG:
            return HandheldConsole.advance
        case .gameboyAdvance:
            return HandheldConsole.nswitch
        case .nintendoSwitch:
            return HandheldConsole.dmg
        }
        
    }

}

//#Preview {
//    GameboyTransitionView()
//}
//
//
