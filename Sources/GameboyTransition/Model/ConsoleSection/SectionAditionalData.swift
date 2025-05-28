//
//  ControllerAditionalData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

struct SectionAditionalData {
    
    private static func actionButtonAngle(console: HandheldConsoleContainer) -> Double {
        switch console {
        case .gameboyDMG:
            Angle(degrees: 60).radians
        case .gameboyAdvance:
            Angle(degrees: 60).radians
        case .nintendoSwitch:
            Angle(degrees: 360).radians
        }
    }
    
    private static func actionButtonCount(console: HandheldConsoleContainer) -> Int {
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
