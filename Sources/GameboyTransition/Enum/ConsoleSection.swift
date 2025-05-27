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
    var sizeProportion: AnimatableSize { get }
    var originPosition: AnimatablePosition { get }
    var color: Color { get }
    
    init(originPosition: AnimatablePosition, sizeProportion: AnimatableSize, color: Color)
    
}

//
protocol DataGroupContainer: DataGroup {
    
}

protocol DataGroupItem: DataGroup {
    associatedtype DataContainer: DataGroupContainer
    
}

enum ConsoleSection: DataGroupItem {
    
    typealias DataContainer = HandheldGameConsole
    
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
    
    
    
    func getStyleData(container: HandheldGameConsole) -> any ComponentStyleData {
        
        
        let geometryData = GeometryData(console: container, consoleSection: self)
        let colorData = ColorData.init(console: container, consoleSection: self)
        
        return ContainerSection(
            originPosition: geometryData.originPosition,
            sizeProportion: geometryData.sizeProportion,
            color: colorData.color
        )
        
    }
    
    
}

protocol DataGroup:  CaseIterable, Hashable, Sendable, Identifiable, CustomStringConvertible {
    
    
}

struct GeometryData {
    
    let console: HandheldGameConsole
    let consoleSection: ConsoleSection
    let originPosition: AnimatablePosition
    let sizeProportion: AnimatableSize

    
    
    init(console: HandheldGameConsole, consoleSection: ConsoleSection) {
        self.console = console
        self.consoleSection = consoleSection
        self.originPosition = GeometryData.originPosition(console: console, consoleSection: consoleSection)
        self.sizeProportion = GeometryData.sizeProportion(console: console, consoleSection: consoleSection)
    }
    
    private static func originPosition(console: HandheldGameConsole, consoleSection: ConsoleSection) -> AnimatablePosition {
        
        switch (console, consoleSection) {
        case (.gameboyDMG, .consoleScreen):
            return .zero
        case (.gameboyDMG, .controllerLeft):
            return .init(x: 0.0, y: 0.5)
        case (.gameboyDMG, .controllerRight):
            return .init(x: 0.5, y: 0.5)
        case (.gameboyAdvance, .consoleScreen):
            return .init(x: 0.0, y: 0.0)
        case (.gameboyAdvance, .controllerLeft):
            return .init(x: 0.25, y: 0.0)
        case (.gameboyAdvance, .controllerRight):
            return .init(x: 0.75, y: 0.0)
        case (.nintendoSwitch, .consoleScreen):
            return .init(x: 0.15, y: 0.0)
        case (.nintendoSwitch, .controllerLeft):
            return .init(x: 0.0, y: 0.0)
        case (.nintendoSwitch, .controllerRight):
            return .init(x: 0.85, y: 0.0)
        }
        
    }
    
    private static func sizeProportion(console: HandheldGameConsole, consoleSection: ConsoleSection) -> AnimatableSize {
        
        switch (console, consoleSection) {
        case (.gameboyDMG, .consoleScreen):
            return .init(width: 1.0, height: 0.5)
        case (.gameboyDMG, .controllerLeft), (.gameboyDMG, .controllerRight):
            return .init(width: 0.5, height: 0.5)
        case (.gameboyAdvance, .consoleScreen):
            return .init(width: 0.5, height: 1.0)
        case (.gameboyAdvance, .controllerLeft), (.gameboyAdvance, .controllerRight):
            return .init(width: 0.25, height: 1.0)
        case (.nintendoSwitch, .consoleScreen):
            return .init(width: 0.15, height: 0.5)
        case (.nintendoSwitch, .controllerLeft), (.nintendoSwitch, .controllerRight):
            return .init(width: 0.7, height: 1.0)
        }
        
    }

}

struct ColorData {
    
    let console: HandheldGameConsole
    let consoleSection: ConsoleSection
    let color: Color
    
    init(console: HandheldGameConsole, consoleSection: ConsoleSection) {
        self.console = console
        self.consoleSection = consoleSection
        self.color = ColorData.getColor(console: console, consoleSection: consoleSection)
    }
    
    private static func getColor(console: HandheldGameConsole, consoleSection: ConsoleSection) -> Color {
        
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

enum ScreenColorData {
    static func color(console: HandheldGameConsole) -> Color {
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
