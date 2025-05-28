//
//  HandheldGameConsole.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

public enum HandheldConsoleContainer: Int, Hashable, Identifiable, CaseIterable {
    
    public var id: Int {
        return self.rawValue
    }
    
    case gameboyDMG = 0
    case gameboyAdvance = 1
    case nintendoSwitch = 2
    
    public var description: String {
        switch self {
        case .gameboyDMG: return "Gameboy"
        case .gameboyAdvance: return "Gameboy Advance"
        case .nintendoSwitch: return "Nintendo Switch"
        }
    }
    
//    var sections: [ConsoleSection] {
//        switch self {
//        case .gameboyDMG:
//            return [.screenSection, .leftControllerSection, .rightControllerSection]
//        case .gameboyAdvance:
//            return [.leftControllerSection, .screenSection, .rightControllerSection]
//        case .nintendoSwitch:
//            return [.leftControllerSection, .screenSection, .rightControllerSection]
//        }
//    }
    
    public static func < (lhs: HandheldConsoleContainer, rhs: HandheldConsoleContainer) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

#Preview {
    PreviewView()
}

