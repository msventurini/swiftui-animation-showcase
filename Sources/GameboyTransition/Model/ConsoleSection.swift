//
//  ConsoleComponent.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

protocol ComponentStyleData {
    associatedtype DataGroupContainer
    var sliceOriginPosition: CGRectEdge { get }
    var sizeProportion: Double { get }
    var color: Color { get }
    
    init(sliceOriginPosition: CGRectEdge, sizeProportion: Double, color: Color)
    
}

protocol DataGroupContainer: DataGroup {
    
}

protocol DataGroupItem: DataGroup {
    associatedtype DataContainer: DataGroupContainer
}

enum ConsoleSection: DataGroupItem {
    
    typealias DataContainer = HandheldConsoleContainer
    
    var id: String {
        return self.description
    }
    
    case consoleScreen
    case controllerRight
    case controllerLeft
    
    var description: String {
        switch self {
        case .consoleScreen:
            "ConsoleScreen"
        case .controllerRight:
            "ControllerRight"
        case .controllerLeft:
            "ControllerLeft"
        }
    }
        
    func getStyleData(container: HandheldConsoleContainer) -> any ComponentStyleData {
        
        let geometryData = GeometryData(console: container, consoleSection: self)
        let colorData = ColorData.init(console: container, consoleSection: self)
        
        return ContainerSection(
            sliceOriginPosition: geometryData.sliceOriginPosition,
            sizeProportion: geometryData.sizeProportion,
            color: colorData.color
        )
    }
}

protocol DataGroup:  CaseIterable, Hashable, Sendable, Identifiable, CustomStringConvertible {
    
}

struct GeometryData {
    
    let console: HandheldConsoleContainer
    let consoleSection: ConsoleSection
    let sliceOriginPosition: CGRectEdge
    let sizeProportion: Double
    
    init(console: HandheldConsoleContainer, consoleSection: ConsoleSection) {
        self.console = console
        self.consoleSection = consoleSection
        self.sliceOriginPosition = GeometryData.sliceOriginPosition(console: console, consoleSection: consoleSection)
        self.sizeProportion = GeometryData.sizeProportion(console: console, consoleSection: consoleSection)
    }
    
    private static func sliceOriginPosition(console: HandheldConsoleContainer, consoleSection: ConsoleSection) -> CGRectEdge {
        
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
    
    private static func sizeProportion(console: HandheldConsoleContainer, consoleSection: ConsoleSection) -> Double {
        
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

struct ColorData {
    
    let console: HandheldConsoleContainer
    let consoleSection: ConsoleSection
    let color: Color
    
    init(console: HandheldConsoleContainer, consoleSection: ConsoleSection) {
        self.console = console
        self.consoleSection = consoleSection
        self.color = ColorData.getColor(console: console, consoleSection: consoleSection)
    }
    
    private static func getColor(console: HandheldConsoleContainer, consoleSection: ConsoleSection) -> Color {
        
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



struct ControllerAditionalData {
    
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
