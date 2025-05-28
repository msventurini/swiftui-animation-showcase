//
//  Bezel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct Bezel {
    
    public let size: AnimatableSize
    
    init(console: HandheldGameConsole) {
        size = Bezel.size(console: console)
    }
    
    private static func size(console: HandheldGameConsole) -> AnimatableSize {
        switch console {
        case .gameboyDMG:
            return .init(width: 70, height: 54)
        case .gameboyAdvance:
            return .init(width: 70, height: 60)
        case .nintendoSwitch:
            return .init(width: 70, height: 60)
        }
    }
}
