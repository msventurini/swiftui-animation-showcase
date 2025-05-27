//
//  Body.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct ChassisBody {
    
    public let size: AnimatableSize
    public let color: Color
    
    init(console: HandheldGameConsole) {
        size = ChassisBody.size(console: console)
        color = ChassisBody.color(console: console)
    }
    
    private static func size(console: HandheldGameConsole) -> AnimatableSize {
        switch console {
        case .gameboyDMG:
            return .init(size: .init(width: 90, height: 148))
        case .gameboyAdvance:
            return .init(size: .init(width: 144, height: 82))
        case .nintendoSwitch:
            return .init(size: .init(width: 144, height: 82))
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
}
