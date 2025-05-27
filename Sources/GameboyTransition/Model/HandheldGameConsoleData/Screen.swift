//
//  Screen.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct Screen {
    
    public let size: AnimatableSize
    
    init(console: HandheldGameConsole) {
        size = Screen.size(console: console)
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
}
