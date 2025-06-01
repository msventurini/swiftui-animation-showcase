//
//  AppDataUtils+SectionProvider.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//

import SwiftUI
import SwiftData
import AnimationFoundation


extension AppDataUtils {
    
    enum SectionData: Int, Identifiable, Hashable, Codable, CaseIterable {
        
        public var id: Int {
            return rawValue
        }
        
        case consoleScreen = 0
        case controllerRight = 1
        case controllerLeft = 2
        
        var name: String {
            switch self {
            case .consoleScreen: "Console Screen"
            case .controllerRight: "Controller Right"
            case .controllerLeft: "Controller Left"
            }
        }
        
        func observableModelFor(container: Container) -> ConsoleSection {
            
            return .init(
                id: self.id,
                originX: self.originX(container: container),
                originY: self.originY(container: container),
                widthRatioToContainer: self.widthProportion(container: container),
                heightRatioToContainer: self.heightProportion(container: container),
                containerWidth: self.containerWidth(container: container),
                containerHeight: self.containerHeight(container: container),
            )
        }
        
//        func observableModelFor(container: Container) -> ConsoleSection {
//
//            return .init(
//                id: self.id,
//                drawingOrderNumber: self.getDrawOrderNumber(at: container),
//                sectionName: self.name,
//                originX: self.originX(container: container),
//                originY: self.originY(container: container),
//                widthRatioToContainer: self.widthProportion(container: container),
//                heightRatioToContainer: self.heightProportion(container: container),
//                containerWidth: self.containerWidth(container: container),
//                containerHeight: self.containerHeight(container: container)
//            )
//        }
        
        public func sliceOriginPosition(console: Container) -> CodableRectEdge {
            
            switch (console.containerID, self) {
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
        
        public func horizontalSliceProportion(console: Container) -> Double {
            
            switch (console.containerID, self) {
            case (.gameboyDMG, .consoleScreen): 0
            case (.gameboyDMG, .controllerLeft): 0.5
            case (.gameboyDMG, .controllerRight): 0.5
                
            case (.gameboyAdvance, .controllerLeft): 0.3
            case (.gameboyAdvance, .consoleScreen): 0.4
            case (.gameboyAdvance, .controllerRight): 0.3
                
            case (.nintendoSwitch, .consoleScreen): 0.2
            case (.nintendoSwitch, .controllerLeft):  0.6
            case (.nintendoSwitch, .controllerRight): 0.2
            }
        }
        
        public func verticalSliceProportion(console: Container) -> Double {
            
            switch (console.containerID, self) {
            case (.gameboyDMG, .consoleScreen): 0.5
            case (.gameboyDMG, .controllerLeft): 0
            case (.gameboyDMG, .controllerRight): 0
                
            case (.gameboyAdvance, .controllerLeft): 0
            case (.gameboyAdvance, .consoleScreen): 0
            case (.gameboyAdvance, .controllerRight): 0
                
            case (.nintendoSwitch, .consoleScreen): 0
            case (.nintendoSwitch, .controllerLeft):  0
            case (.nintendoSwitch, .controllerRight): 0
            }
        }
       
        public func originX(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, .consoleScreen): .zero
            case (.gameboyDMG, .controllerLeft): .zero
            case (.gameboyDMG, .controllerRight): 0.5
                
            case (.gameboyAdvance, .controllerLeft): .zero
            case (.gameboyAdvance, .consoleScreen): 0.3
            case (.gameboyAdvance, .controllerRight): 0.7
                
            case (.nintendoSwitch, .consoleScreen): .zero
            case (.nintendoSwitch, .controllerLeft):  0.2
            case (.nintendoSwitch, .controllerRight): 0.8
            }
        }
        
        public func originY(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, .consoleScreen): .zero 
            case (.gameboyDMG, .controllerLeft): 0.5 
            case (.gameboyDMG, .controllerRight): 0.5 
            case (.gameboyAdvance, .controllerLeft): .zero 
            case (.gameboyAdvance, .consoleScreen): .zero 
            case (.gameboyAdvance, .controllerRight): .zero 
            case (.nintendoSwitch, .consoleScreen): .zero 
            case (.nintendoSwitch, .controllerLeft): .zero 
            case (.nintendoSwitch, .controllerRight): .zero 
            }
        }
        
        public func widthProportion(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, .consoleScreen): 1.0
            case (.gameboyDMG, .controllerLeft): 0.5
            case (.gameboyDMG, .controllerRight): 0.5
                
            case (.gameboyAdvance, .controllerLeft): 0.3
            case (.gameboyAdvance, .consoleScreen): 0.4
            case (.gameboyAdvance, .controllerRight): 0.3
                
            case (.nintendoSwitch, .consoleScreen): 0.2
            case (.nintendoSwitch, .controllerLeft): 0.6
            case (.nintendoSwitch, .controllerRight): 0.2
            }
        }

        public func heightProportion(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, .consoleScreen): 0.5
            case (.gameboyDMG, .controllerLeft): 0.5
            case (.gameboyDMG, .controllerRight): 0.5
                
            case (.gameboyAdvance, .controllerLeft): 1.0
            case (.gameboyAdvance, .consoleScreen): 1.0
            case (.gameboyAdvance, .controllerRight): 1.0
                
            case (.nintendoSwitch, .consoleScreen): 1.0
            case (.nintendoSwitch, .controllerLeft): 1.0
            case (.nintendoSwitch, .controllerRight): 1.0
            }
        }
        
        public func containerWidth(container: Container) -> Double {
            return container.width
        }
        
        public func containerHeight(container: Container) -> Double {
            return container.height
        }
    
        
        public func getColor(console: Container) -> AnimatableColor {
            
            switch (console.containerID, self) {
            case (.gameboyDMG, _): AnimatableColor(red: 190/255, green: 190/255, blue: 190/255, opacity: 1)
            case (.gameboyAdvance, _): AnimatableColor(red: 94/255, green: 92/255, blue: 230/255, opacity: 1)
            case (.nintendoSwitch, .consoleScreen): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
            case (.nintendoSwitch, .controllerLeft): AnimatableColor(red: 1, green: 0, blue: 0, opacity: 1)
            case (.nintendoSwitch, .controllerRight): AnimatableColor(red: 0, green: 0, blue: 1, opacity: 1)
            }
        }
        
        public func getDrawOrderNumber(
            at container: Container
        ) -> Int {
            
            switch (container.containerID, self) {
                
            case (.gameboyDMG, .consoleScreen): 0
            case (.gameboyDMG, .controllerLeft): 1
            case (.gameboyDMG, .controllerRight): 2
                
            case (.gameboyAdvance, .consoleScreen): 0
            case (.gameboyAdvance, .controllerLeft): 1
            case (.gameboyAdvance, .controllerRight): 2
                
                
//            case (.gameboyAdvance, .consoleScreen): 1
//            case (.gameboyAdvance, .controllerLeft): 0
//            case (.gameboyAdvance, .controllerRight): 2
                
            case (.nintendoSwitch, .consoleScreen): 0
            case (.nintendoSwitch, .controllerLeft): 1
            case (.nintendoSwitch, .controllerRight): 2
                
            }
            
        }
        
        //        private static func getDrawOrderNumber(
        //            for section: AppDataUtils.SectionProvider,
        //            at container: AppDataUtils.ContainerProvider
        //        ) -> Int {
        //
        //            switch (container, section) {
        //
        //            case (.gameboyDMG, .consoleScreen): 0
        //            case (.gameboyDMG, .controllerLeft): 1
        //            case (.gameboyDMG, .controllerRight): 2
        //
        //            case (.gameboyAdvance, .consoleScreen): 1
        //            case (.gameboyAdvance, .controllerLeft): 0
        //            case (.gameboyAdvance, .controllerRight): 2
        //
        //            case (.nintendoSwitch, .consoleScreen): 1
        //            case (.nintendoSwitch, .controllerLeft): 0
        //            case (.nintendoSwitch, .controllerRight): 2
        //
        //            }
        //
        //        }
        
    }
    
    
    
    
}

//
//
//        public static func insertContainerDefaultData(section: AppDataUtils.SectionProvider, into console: Console, context: ModelContext) {
//
//            console.sections.forEach { section in
//                ConsoleSection(
//                    orderNumber: AppDataUtils.SectionProvider.getDrawOrderNumber(for: section, at: console),
//                    color: <#T##AnimatableColor#>, originPosition: <#T##CodableRectEdge#>, sizeProportion: <#T##Double#>)
//            }
//
//        }

//private static func allCasesFor(console: AppDataUtils.ContainerProvider) -> [ConsoleSection] {
//
//    switch (console, consoleSection) {
//    case (.gameboyDMG, _): AnimatableColor(red: 190/255, green: 190/255, blue: 190/255, opacity: 1)
//    case (.gameboyAdvance, _): AnimatableColor(red: 94/255, green: 92/255, blue: 230/255, opacity: 1)
//    case (.nintendoSwitch, .consoleScreen): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
//    case (.nintendoSwitch, .controllerLeft): AnimatableColor(red: 1, green: 0, blue: 0, opacity: 1)
//    case (.nintendoSwitch, .controllerRight): AnimatableColor(red: 0, green: 0, blue: 1, opacity: 1)
//    }
//}


//
//static func allSectionModels: [ConsoleSection] {
//    return SectionProvider
//        .allCases
//        .map({
//            ConsoleSection(
//                orderNumber: , color: <#T##AnimatableColor#>, originPosition: <#T##CodableRectEdge#>, sizeProportion: <#T##Double#>)
//
//            Console(
//                chronologicalNumber: $0.chronologicalNumber,
//                containerName: $0.description,
//                width: $0.width,
//                height: $0.height
//            ) })
//}


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
//
//
//}
