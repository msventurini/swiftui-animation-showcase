//
//  HandheldGameConsole.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation



public enum HandheldGameConsole: String, DataGroupContainer {
    public var id: String {
        return self.description
    }
    
    case gameboyDMG
    case gameboyAdvance
    case nintendoSwitch
    
    public var description: String {
        switch self {
        case .gameboyDMG: return "Gameboy"
        case .gameboyAdvance: return "Gameboy Advance"
        case .nintendoSwitch: return "Nintendo Switch"
        }
    }
    
    var bezel: Bezel {
        return .init(console: self)
    }

    var handheldLayout: HandheldLayout {
        switch self {
        case .gameboyDMG:
                .vertical
        case .gameboyAdvance:
                .horizontal
        case .nintendoSwitch:
                .horizontal
        }
    }
    
    var sections: [ConsoleSection] {
        switch self {
        case .gameboyDMG:
            return [.consoleScreen, .controllerLeft, .controllerRight]
        case .gameboyAdvance:
            return [.consoleScreen, .controllerLeft, .controllerRight]
        case .nintendoSwitch:
            return [.consoleScreen, .controllerLeft, .controllerRight]
        }
    }
}
