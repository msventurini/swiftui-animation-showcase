//
//  SectionGeometryData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation


internal struct SectionGeometryData {
    
    let console: AppDataUtils.ContainerProvider
    let consoleSectionIdentifier: SectionIdentifier
    let sliceOriginPosition: CGRectEdge
    let sizeProportion: Double
    
    internal init(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) {
        self.console = console
        self.consoleSectionIdentifier = consoleSection
        self.sliceOriginPosition = SectionGeometryData.sliceOriginPosition(console: console, consoleSection: consoleSection)
        self.sizeProportion = SectionGeometryData.sizeProportion(console: console, consoleSection: consoleSection)
    }
    
    private static func sliceOriginPosition(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) -> CGRectEdge {
        
        switch (console, consoleSection) {
        case (.gameboyDMG, .consoleScreen):
            return .minYEdge
        case (.gameboyDMG, .controllerLeft):
            return .minXEdge
        case (.gameboyDMG, .controllerRight):
            return .minXEdge
            
        case (.gameboyAdvance, .controllerLeft):
            return .minXEdge
        case (.gameboyAdvance, .consoleScreen):
            return .minXEdge
        case (.gameboyAdvance, .controllerRight):
            return .minXEdge
            
        case (.nintendoSwitch, .consoleScreen):
            return .minXEdge
        case (.nintendoSwitch, .controllerLeft):
            return .minXEdge
        case (.nintendoSwitch, .controllerRight):
            return .minXEdge
        }
    }
    
    private static func sizeProportion(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) -> Double {
        
        switch (console, consoleSection) {
        case (.gameboyDMG, .consoleScreen):
            return 0.5
        case (.gameboyDMG, .controllerLeft):
            return 0.5
        case (.gameboyDMG, .controllerRight):
            return 0.5
            
        case (.gameboyAdvance, .controllerLeft):
            return 0.3
        case (.gameboyAdvance, .consoleScreen):
            return 0.4
        case (.gameboyAdvance, .controllerRight):
            return 0.3
            
        case (.nintendoSwitch, .consoleScreen):
            return 0.2
        case (.nintendoSwitch, .controllerLeft):
            return 0.6
        case (.nintendoSwitch, .controllerRight):
            return 0.2
        }
    }
}
