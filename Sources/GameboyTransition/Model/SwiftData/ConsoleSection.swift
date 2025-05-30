//
//  ContainerSectionModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation
import SwiftData

@Model public class ConsoleSection: Identifiable, Equatable, Hashable {

    public var id: Int
    
    public var drawingOrderNumber: Int
    public var sectionName: String

    public var console: Container?
    
    public var originX: Double
    public var originY: Double
    
    public var widthRatioToContainer: Double
    public var heightRatioToContainer: Double

    public var containerWidth: Double
    public var containerHeight: Double
    
    public var width: Double
    public var height: Double
//    
//    public var centerPointX: Double
//    public var centerPointY: Double
//    
    
    init(id: Int, drawingOrderNumber: Int, sectionName: String, originX: Double, originY: Double, widthRatioToContainer: Double, heightRatioToContainer: Double, containerWidth: Double, containerHeight: Double, /*centerPointX: Double, centerPointY: Double,*/ console: Container? = nil) {
        self.id = id
        
        self.drawingOrderNumber = drawingOrderNumber
        self.sectionName = sectionName
        
        self.originX = originX
        self.originY = originY
        
        self.widthRatioToContainer = widthRatioToContainer
        self.heightRatioToContainer = heightRatioToContainer
        
        self.containerWidth = containerWidth
        self.containerHeight = containerWidth
        self.width = containerWidth * widthRatioToContainer
        self.height = containerHeight * heightRatioToContainer
        self.console = console
        
//        self.centerPointX = centerPointX
//        self.centerPointY = centerPointY
    }
    
//    init(id: Int, drawingOrderNumber: Int, sectionName: String, originX: Double, originY: Double, widthProportion: Double, heightProportion: Double, width: Double, heigh: Double, horizontalSliceProportion: Double, verticalSliceProportion: Double) {
//        self.id = id
//        self.drawingOrderNumber = drawingOrderNumber
//        self.sectionName = sectionName
//        self.widthProportion = widthProportion
//        self.heightProportion = heightProportion
//        self.width = width
//        self.heigh = heigh
//        
//        
//    }

    public static func == (lhs: ConsoleSection, rhs: ConsoleSection) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
}

        
//
//    
//        
//        public func getColor(console: Container) -> AnimatableColor {
//            
//            switch (console.containerID, self) {
//            case (.gameboyDMG, _): AnimatableColor(red: 190/255, green: 190/255, blue: 190/255, opacity: 1)
//            case (.gameboyAdvance, _): AnimatableColor(red: 94/255, green: 92/255, blue: 230/255, opacity: 1)
//            case (.nintendoSwitch, .consoleScreen): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
//            case (.nintendoSwitch, .controllerLeft): AnimatableColor(red: 1, green: 0, blue: 0, opacity: 1)
//            case (.nintendoSwitch, .controllerRight): AnimatableColor(red: 0, green: 0, blue: 1, opacity: 1)
//            }
//        }
//        
//        public func getDrawOrderNumber(
//            at container: Container
//        ) -> Int {
//            
//            switch (container.containerID, self) {
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
//        
