//
//  Controller.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct Controller {
    
    public let actionButtonAngle: Double
    public let actionButtonCount: Int
    
    init(console: HandheldGameConsole) {
        actionButtonAngle = Controller.actionButtonAngle(console: console)
        actionButtonCount = Controller.actionButtonCount(console: console)
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
