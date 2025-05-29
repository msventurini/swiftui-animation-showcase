//
//  ContainerSectionModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData
import AnimationFoundation

@Model class ConsoleSectionModel {

    var drawingOrderNumber: Int

    var sectionID: SectionIdentifier

    private var animatableColor: AnimatableColor

    var sizeProportion: Double
    
    private var codableSliceOriginPosition: CodableRectEdge
    
    var sliceOriginPosition: CGRectEdge {
        return codableSliceOriginPosition.asCGRectEdge
    }
    
    var color: Color {
        return animatableColor.asSwiftUIColor()
    }
    
    init(
        orderNumber drawingOrderNumber: Int,
        section sectionID: SectionIdentifier,
        color animatableColor: AnimatableColor,
        originPosition: CodableRectEdge,
        sizeProportion: Double
    ) {
        self.drawingOrderNumber = drawingOrderNumber
        self.sectionID = sectionID
        self.animatableColor = animatableColor
        self.codableSliceOriginPosition = originPosition
        self.sizeProportion = sizeProportion
    }
}


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
//    private static func sliceOriginPosition(console: AppDataUtils.ContainerProvider, consoleSection: SectionIdentifier) -> CGRectEdge {
//        
//        switch (console, consoleSection) {
//        case (.gameboyDMG, .consoleScreen):
//            return .minYEdge
//        case (.gameboyDMG, .controllerLeft):
//            return .minXEdge
//        case (.gameboyDMG, .controllerRight):
//            return .minXEdge
//            
//        case (.gameboyAdvance, .controllerLeft):
//            return .minXEdge
//        case (.gameboyAdvance, .consoleScreen):
//            return .minXEdge
//        case (.gameboyAdvance, .controllerRight):
//            return .minXEdge
//            
//        case (.nintendoSwitch, .consoleScreen):
//            return .minXEdge
//        case (.nintendoSwitch, .controllerLeft):
//            return .minXEdge
//        case (.nintendoSwitch, .controllerRight):
//            return .minXEdge
//        }
//    }
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
