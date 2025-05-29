//
//  AppDataUtils+SectionProvider.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//

import SwiftUI
import AnimationFoundation

extension AppDataUtils {
    
    private static func sliceOriginPosition(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) -> CodableRectEdge {
        
        switch (console, consoleSection) {
        case (.gameboyDMG, .consoleScreen): .minY
        case (.gameboyDMG, .controllerLeft): .minX
        case (.gameboyDMG, .controllerRight): .minX
            
        case (.gameboyAdvance, .controllerLeft): .minX
        case (.gameboyAdvance, .consoleScreen): .minX
        case (.gameboyAdvance, .controllerRight): .minX

        case (.nintendoSwitch, .consoleScreen): .minX
        case (.nintendoSwitch, .controllerLeft):  .minX
        case (.nintendoSwitch, .controllerRight): .minX
        }
    }
    
}


//public enum ContainerProvider: Int, Hashable, Identifiable, CaseIterable {
//
//    public var id: Int {
//        return self.rawValue
//    }
//
//    case gameboyDMG = 0
//    case gameboyAdvance = 1
//    case nintendoSwitch = 2
//
//    var description: String {
//        switch self {
//        case .gameboyDMG: return "Gameboy"
//        case .gameboyAdvance: return "Gameboy Advance"
//        case .nintendoSwitch: return "Nintendo Switch"
//        }
//    }
//
//    static var allContainerModels: [Console] {
//        return ContainerProvider
//            .allCases
//            .map({ Console(
//                containerName: $0.description,
//                width: $0.width,
//                height: $0.height
//            ) })
//    }
//
//    var releaseOrderNumber: Int {
//        switch self {
//        case .gameboyDMG: 0
//        case .gameboyAdvance: 1
//        case .nintendoSwitch: 2
//        }
//    }
//
//    var width: Double {
//        switch self {
//        case .gameboyDMG: 90
//        case .gameboyAdvance: 144
//        case .nintendoSwitch: 240
//        }
//    }
//
//    var height: Double {
//        switch self {
//        case .gameboyDMG: 148
//        case .gameboyAdvance: 82
//        case .nintendoSwitch: 102
//        }
//    }
//}


//
//internal struct SectionGeometryData {
//
//    let console: AppDataUtils.ContainerProvider
//    let consoleSectionIdentifier: SectionIdentifier
//    let sliceOriginPosition: CGRectEdge
//    let sizeProportion: Double
//
//    internal init(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) {
//        self.console = console
//        self.consoleSectionIdentifier = consoleSection
//        self.sliceOriginPosition = SectionGeometryData.sliceOriginPosition(console: console, consoleSection: consoleSection)
//        self.sizeProportion = SectionGeometryData.sizeProportion(console: console, consoleSection: consoleSection)
//    }
//

//
//    private static func sizeProportion(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) -> Double {
//
//        switch (console, consoleSection) {
//        case (.gameboyDMG, .consoleScreen):
//            return 0.5
//        case (.gameboyDMG, .controllerLeft):
//            return 0.5
//        case (.gameboyDMG, .controllerRight):
//            return 0.5
//
//        case (.gameboyAdvance, .controllerLeft):
//            return 0.3
//        case (.gameboyAdvance, .consoleScreen):
//            return 0.4
//        case (.gameboyAdvance, .controllerRight):
//            return 0.3
//
//        case (.nintendoSwitch, .consoleScreen):
//            return 0.2
//        case (.nintendoSwitch, .controllerLeft):
//            return 0.6
//        case (.nintendoSwitch, .controllerRight):
//            return 0.2
//        }
//    }
//}
//
//
//public struct ColorData {
//
//    public let console: AppDataUtils.ContainerProvider
//    public let consoleSectionIdentifier: SectionIdentifier
//    public let color: AnimatableColor
//
//    public init(console: AppDataUtils.ContainerProvider, consoleSectionIdentifier: SectionIdentifier) {
//        self.console = console
//        self.consoleSectionIdentifier = consoleSectionIdentifier
//        self.color = ColorData.getColor(console: console, consoleSection: consoleSectionIdentifier)
//    }
//
//    private static func getColor(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) -> AnimatableColor {
//
//        switch (console, consoleSection) {
//        case (.gameboyDMG, _):
//            return AnimatableColor(red: 190/255, green: 190/255, blue: 190/255, opacity: 1)
//        case (.gameboyAdvance, _):
//            return AnimatableColor(red: 94/255, green: 92/255, blue: 230/255, opacity: 1)
//        case (.nintendoSwitch, .consoleScreen):
//            return AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
//        case (.nintendoSwitch, .controllerLeft):
//            return AnimatableColor(red: 1, green: 0, blue: 0, opacity: 1)
//        case (.nintendoSwitch, .controllerRight):
//            return AnimatableColor(red: 0, green: 0, blue: 1, opacity: 1)
//        }
//    }
//
//}
