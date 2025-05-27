//
//  Screen.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct ScreenSection: ComponentStyleData {
    typealias DataGroupContainer = HandheldGameConsole
    
    
    public let size: AnimatableSize
    public let color: Color
    
    init(container: HandheldGameConsole) {
        size = ScreenSection.size(console: container)
        color = ScreenSection.color(console: container)
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
}
