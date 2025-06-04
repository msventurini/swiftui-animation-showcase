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
        
        public func sliceOriginPosition(console: Container) -> CodableRectEdge {
            
            switch (console.containerID, self) {
            case (.gameboyDMG, .screenLeft): .minY
            case (.gameboyDMG, .screenRight): .minX
            case (.gameboyDMG, .controllerLeft): .minX
            case (.gameboyDMG, .controllerRight): .minX
                
            case (.gameboyAdvance, .controllerLeft): .minX
            case (.gameboyAdvance, .screenLeft): .minX
            case (.gameboyAdvance, .screenRight): .minX
            case (.gameboyAdvance, .controllerRight): .minX
                
            case (.nintendoSwitch, .screenLeft): .minX
            case (.nintendoSwitch, .screenRight): .minX
            case (.nintendoSwitch, .controllerLeft):  .minX
            case (.nintendoSwitch, .controllerRight): .minX
            }
        }
        
        public func horizontalSliceProportion(console: Container) -> Double {
            
            switch (console.containerID, self) {
            case (.gameboyDMG, .screenLeft): 0.5
            case (.gameboyDMG, .screenRight): 0
            case (.gameboyDMG, .controllerLeft): 0.5
            case (.gameboyDMG, .controllerRight): 0.5
                
            case (.gameboyAdvance, .controllerLeft): 0.2
            case (.gameboyAdvance, .screenLeft): 0.3
            case (.gameboyAdvance, .screenRight): 0.3
            case (.gameboyAdvance, .controllerRight): 0.2
                
            case (.nintendoSwitch, .screenLeft): 0.35
            case (.nintendoSwitch, .screenRight):  0.35
            case (.nintendoSwitch, .controllerLeft):  0.15
            case (.nintendoSwitch, .controllerRight): 0.15
            }
        }
        
        public func verticalSliceProportion(console: Container) -> Double {
            
            switch (console.containerID, self) {
            case (.gameboyDMG, .screenLeft): 0.5
            case (.gameboyDMG, .screenRight): 0
            case (.gameboyDMG, .controllerLeft): 0
            case (.gameboyDMG, .controllerRight): 0
                
            case (.gameboyAdvance, .controllerLeft): 0
            case (.gameboyAdvance, .screenLeft): 0
            case (.gameboyAdvance, .screenRight): 0
            case (.gameboyAdvance, .controllerRight): 0
                
            case (.nintendoSwitch, .screenLeft): 0
            case (.nintendoSwitch, .screenRight): 0
            case (.nintendoSwitch, .controllerLeft):  0
            case (.nintendoSwitch, .controllerRight): 0
            }
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
            case (.nintendoSwitch, .screenRight):     0.40
            case (.nintendoSwitch, .controllerRight): 0.85
            }
        }
        
        public func originY(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, .screenLeft): .zero
            case (.gameboyDMG, .screenRight): .zero
            case (.gameboyDMG, .controllerLeft): 0.5
            case (.gameboyDMG, .controllerRight): 0.5 
            case (.gameboyAdvance, .controllerLeft): .zero 
            case (.gameboyAdvance, .screenLeft): .zero
            case (.gameboyAdvance, .screenRight): .zero
            case (.gameboyAdvance, .controllerRight): .zero
            case (.nintendoSwitch, .screenLeft): .zero
            case (.nintendoSwitch, .screenRight): .zero
            case (.nintendoSwitch, .controllerLeft): .zero
            case (.nintendoSwitch, .controllerRight): .zero 
            }
        }
        
        public func widthProportion(container: Container) -> Double {
            switch (container.containerID, self) {
            case (.gameboyDMG, .screenLeft): 0.4
            case (.gameboyDMG, .screenRight): 0.4
            case (.gameboyDMG, .controllerLeft): 0.5
            case (.gameboyDMG, .controllerRight): 0.5
            
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
            case (.gameboyDMG, .screenLeft): 0.5
            case (.gameboyDMG, .screenRight): 0.5
            case (.gameboyDMG, .controllerLeft): 0.5
            case (.gameboyDMG, .controllerRight): 0.5
                
            case (.gameboyAdvance, .controllerLeft): 1.0
            case (.gameboyAdvance, .screenLeft): 1.0
            case (.gameboyAdvance, .screenRight): 1.0
            case (.gameboyAdvance, .controllerRight): 1.0
                
            case (.nintendoSwitch, .screenLeft): 1.0
            case (.nintendoSwitch, .screenRight): 1.0
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
            case (.nintendoSwitch, .screenLeft): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
            case (.nintendoSwitch, .screenRight): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
            case (.nintendoSwitch, .controllerLeft): AnimatableColor(red: 1, green: 0, blue: 0, opacity: 1)
            case (.nintendoSwitch, .controllerRight): AnimatableColor(red: 0, green: 0, blue: 1, opacity: 1)
            }
        }
        
        public func getDrawOrderNumber(
            at container: Container
        ) -> Int {
            
            switch (container.containerID, self) {
                
            case (.gameboyDMG, .screenLeft): 0
            case (.gameboyDMG, .screenRight): 1
            case (.gameboyDMG, .controllerLeft): 2
            case (.gameboyDMG, .controllerRight): 3
                
            case (.gameboyAdvance, .screenLeft): 0
            case (.gameboyAdvance, .screenRight): 1
            case (.gameboyAdvance, .controllerLeft): 2
            case (.gameboyAdvance, .controllerRight): 3
                
            case (.nintendoSwitch, .screenLeft): 0
            case (.nintendoSwitch, .screenRight): 1
            case (.nintendoSwitch, .controllerLeft): 2
            case (.nintendoSwitch, .controllerRight): 3
                
            }
        }
    }
}
