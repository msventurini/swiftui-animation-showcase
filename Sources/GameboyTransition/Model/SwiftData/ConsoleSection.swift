//
//  ContainerSectionModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import AnimationFoundation

public struct ConsoleSection: Identifiable, Equatable, Hashable {

    public var id: Int

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

    init(id: Int, originX: Double, originY: Double, widthRatioToContainer: Double, heightRatioToContainer: Double, containerWidth: Double, containerHeight: Double) {
        
        self.id = id
        
        self.widthRatioToContainer = widthRatioToContainer
        self.heightRatioToContainer = heightRatioToContainer
        
        self.containerWidth = containerWidth
        self.containerHeight = containerWidth
        self.width = containerWidth * widthRatioToContainer
        self.height = containerHeight * heightRatioToContainer
        
        let centerX = (originX + (widthRatioToContainer * 0.5)) - 0.5
        let centerY = (originY + (heightRatioToContainer * 0.5)) - 0.5
        self.centerPointX = centerX
        self.centerPointY = centerY
        
        self.centerDistanceX = centerX * containerWidth
        self.centerDistanceY = centerY * containerHeight
        
    }
    
//    public static func == (lhs: ConsoleSection, rhs: ConsoleSection) -> Bool {
//        lhs.id == rhs.id
//    }
    
}
