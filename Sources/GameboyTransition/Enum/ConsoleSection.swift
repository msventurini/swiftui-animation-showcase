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
    var size: AnimatableSize { get }
    var color: Color { get }
    
    init(container: DataGroupContainer)

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
        switch self {
        case .consoleScreen:
            return ScreenSection(container: container)
        case .controllerRight:
            return ControllerSection(container: container)
        case .controllerLeft:
            return ControllerSection(container: container)
        }
    }
    
    
}

protocol DataGroup:  CaseIterable, Hashable, Sendable, Identifiable, CustomStringConvertible {
    
    
}


