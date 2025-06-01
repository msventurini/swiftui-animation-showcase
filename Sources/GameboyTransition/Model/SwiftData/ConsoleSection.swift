//
//  ContainerSectionModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

@Observable public class ConsoleSection: Identifiable, Equatable, Hashable {

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
    
    public var centerPointX: Double
    public var centerPointY: Double
    
    public var centerDistanceX: Double
    public var centerDistanceY: Double

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
        
        let centerX = (originX + (widthRatioToContainer * 0.5)) - 0.5
        let centerY = (originY + (heightRatioToContainer * 0.5)) - 0.5
        self.centerPointX = centerX
        self.centerPointY = centerY
        
        self.centerDistanceX = centerX * containerWidth
        self.centerDistanceY = centerY * containerHeight
        
    }
    
    public static func == (lhs: ConsoleSection, rhs: ConsoleSection) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
}
