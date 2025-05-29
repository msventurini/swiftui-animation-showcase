//
//  ColorData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

internal struct ColorData {
    
    let console: AppDataUtils.ContainerProvider
    let consoleSectionIdentifier: SectionIdentifier
    let color: Color
    
    init(console: AppDataUtils.ContainerProvider, consoleSectionIdentifier: SectionIdentifier) {
        self.console = console
        self.consoleSectionIdentifier = consoleSectionIdentifier
        self.color = ColorData.getColor(console: console, consoleSection: consoleSectionIdentifier)
    }
    
    private static func getColor(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) -> Color {
        
        switch (console, consoleSection) {
        case (.gameboyDMG, _):
            return .init(red: 190/255, green: 190/255, blue: 190/255)
        case (.gameboyAdvance, _):
            return .init(red: 94/255, green: 92/255, blue: 230/255)
        
        case (.nintendoSwitch, .consoleScreen):
            return .black
        case (.nintendoSwitch, .controllerLeft):
            return .red
        case (.nintendoSwitch, .controllerRight):
            return .blue
        }
    }
    
}
