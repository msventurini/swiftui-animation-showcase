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
//    
//    var screen: ScreenSection {
//        //        ConsoleSection.consoleScreen.getStyleData(container: <#T##HandheldGameConsole#>)
//        return .init(container: self)
//        //        return styleDataFor(component: .consoleScreen)
//    }
//    
//    var controller: ControllerSection {
//        return .init(container: self)
//    }
//    
    //USAR ANY VAI SER BUG NO FUTURO, RESOLVER
    //    func styleDataFor(component: ConsoleSection) -> ComponentStyleData {
    func styleDataFor(component: ConsoleSection) -> any ComponentStyleData {
        return component.getStyleData(container: self)
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
    
    var size: AnimatableSize {
        switch self {
        case .gameboyDMG:
            return .init(size: .init(width: 90, height: 148))
        case .gameboyAdvance:
            return .init(size: .init(width: 144, height: 82))
        case .nintendoSwitch:
            return .init(size: .init(width: 144, height: 82))
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
    //    height = <user-chosen width> * original height / original width
    //
    //    width = <user-chosen height> * original width / original height
    
    
    var widthRatio: Double {
        
        guard isSizeNotZeroOrNegative && isWidthLessThanHeight else {
            return 1
        }
        
        return widthSize / heightSize
        
    }
    
    var heightRatio: Double {
        
        guard isSizeNotZeroOrNegative && isHeightLessThanWidth else {
            return 1
        }
        
        return heightSize / widthSize
        
    }
    
    var isSizeNotZeroOrNegative: Bool {
        return (widthSize > 0) && (heightSize > 0)
    }
    
    var isWidthLessThanHeight: Bool {
        return (widthSize < heightSize)
    }
    
    var isHeightLessThanWidth: Bool {
        return (widthSize < heightSize)
    }
    
    var widthSize: Double {
        switch self {
        case .gameboyDMG:
            return 90
        case .gameboyAdvance:
            return 10
        case .nintendoSwitch:
            return 10
        }
    }
    
    var heightSize: Double {
        switch self {
        case .gameboyDMG:
            return 148
        case .gameboyAdvance:
            return 10
        case .nintendoSwitch:
            return 10
        }
    }
    
    //    11x18
    
    
}
