//
//  Controller.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct ControllerSection: ComponentStyleData {
    typealias DataGroupContainer = HandheldGameConsole
    
    
    public let size: AnimatableSize
    public let color: Color
    
    public let actionButtonAngle: Double
    public let actionButtonCount: Int
    
    init(container: HandheldGameConsole) {
        actionButtonAngle = ControllerSection.actionButtonAngle(console: container)
        actionButtonCount = ControllerSection.actionButtonCount(console: container)
        size = ControllerSection.size(console: container)
        color = ControllerSection.color(console: container)
    }
    
    private static func size(console: HandheldGameConsole) -> AnimatableSize {
        switch console {
        case .gameboyDMG:
            return .init(width: 47, height: 43)
        case .gameboyAdvance:
            return .init(width: 61, height: 41)
        case .nintendoSwitch:
            return .init(width: 61, height: 41)
        }
    }
    
    private static func color(console: HandheldGameConsole) -> Color {
        switch console {
        case .gameboyDMG:
            return .init(red: 190/255, green: 190/255, blue: 190/255)
        case .gameboyAdvance:
            return .init(red: 94/255, green: 92/255, blue: 230/255)
        case .nintendoSwitch:
            return .init(red: 94/255, green: 92/255, blue: 230/255)
        }
    }
    
    private static func actionButtonAngle(console: HandheldGameConsole) -> Double {
        switch console {
        case .gameboyDMG:
            Angle(degrees: 60).radians
        case .gameboyAdvance:
            Angle(degrees: 60).radians
        case .nintendoSwitch:
            Angle(degrees: 360).radians
        }
    }
    
    private static func actionButtonCount(console: HandheldGameConsole) -> Int {
        switch console {
        case .gameboyDMG:
            2
        case .gameboyAdvance:
            2
        case .nintendoSwitch:
            4
        }
    }
}
