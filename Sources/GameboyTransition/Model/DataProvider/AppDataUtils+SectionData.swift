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
        
        case screenLeft = 0
        case screenRight
        case controllerLeft
        case controllerRight
        
        var name: String {
            switch self {
            case .screenLeft: "Screen Left"
            case .screenRight: "Screen Right"
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
        
       
        public func originX(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, .screenLeft): .zero
            case (.gameboyDMG, .screenRight): 0.5
            case (.gameboyDMG, .controllerLeft): .zero
            case (.gameboyDMG, .controllerRight): 0.5
                
            case (.gameboyAdvance, .controllerLeft): .zero
            case (.gameboyAdvance, .screenLeft): 0.2
            case (.gameboyAdvance, .screenRight): 0.5
            case (.gameboyAdvance, .controllerRight): 0.8
            
            case (.nintendoSwitch, .controllerLeft):    .zero
            case (.nintendoSwitch, .screenLeft):     0.15
            case (.nintendoSwitch, .screenRight):     0.50
            case (.nintendoSwitch, .controllerRight): 0.85
            }
        }
        
        public func originY(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, .screenLeft), (.gameboyDMG, .screenRight): .zero
            case (.gameboyDMG, .controllerLeft), (.gameboyDMG, .controllerRight): 0.5
            case (.gameboyAdvance, _), (.nintendoSwitch, _): .zero
            }
        }
        
        public func widthProportion(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, _): 0.5
            
            case (.gameboyAdvance, .screenLeft): 0.3
            case (.gameboyAdvance, .screenRight): 0.3
            case (.gameboyAdvance, .controllerLeft): 0.2
            case (.gameboyAdvance, .controllerRight): 0.2
                
            case (.nintendoSwitch, .screenLeft): 0.35
            case (.nintendoSwitch, .screenRight): 0.35
            case (.nintendoSwitch, .controllerLeft): 0.15
            case (.nintendoSwitch, .controllerRight): 0.15
            }
        }

        public func heightProportion(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, _): 0.5    
            case (.gameboyAdvance, _): 1.0
            case (.nintendoSwitch, _): 1.0
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
            case (.nintendoSwitch, .screenLeft): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
            case (.nintendoSwitch, .screenRight): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
            case (.nintendoSwitch, .controllerLeft): AnimatableColor(red: 1, green: 0, blue: 0, opacity: 1)
            case (.nintendoSwitch, .controllerRight): AnimatableColor(red: 0, green: 0, blue: 1, opacity: 1)
            }
        }
        
    }
}
