//
//  HandheldGameConsole.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

public enum HandheldGameConsole: Sendable {
    case gameboyDMG
    case gameboyAdvance
    case nintendoSwitch
    
    var bezel: Bezel {
        return .init(console: self)
    }
    
    var screen: Screen {
        return .init(console: self)
    }
    
    var controller: Controller {
        return .init(console: self)
    }
    
    var chassisBody: ChassisBody {
        return .init(console: self)
    }
    
}
